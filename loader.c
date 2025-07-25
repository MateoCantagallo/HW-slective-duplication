/* loader.c - program loader routines */

/* SimpleScalar(TM) Tool Suite
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 * All Rights Reserved. 
 * 
 * THIS IS A LEGAL DOCUMENT, BY USING SIMPLESCALAR,
 * YOU ARE AGREEING TO THESE TERMS AND CONDITIONS.
 * 
 * No portion of this work may be used by any commercial entity, or for any
 * commercial purpose, without the prior, written permission of SimpleScalar,
 * LLC (info@simplescalar.com). Nonprofit and noncommercial use is permitted
 * as described below.
 * 
 * 1. SimpleScalar is provided AS IS, with no warranty of any kind, express
 * or implied. The user of the program accepts full responsibility for the
 * application of the program and the use of any results.
 * 
 * 2. Nonprofit and noncommercial use is encouraged. SimpleScalar may be
 * downloaded, compiled, executed, copied, and modified solely for nonprofit,
 * educational, noncommercial research, and noncommercial scholarship
 * purposes provided that this notice in its entirety accompanies all copies.
 * Copies of the modified software can be delivered to persons who use it
 * solely for nonprofit, educational, noncommercial research, and
 * noncommercial scholarship purposes provided that this notice in its
 * entirety accompanies all copies.
 * 
 * 3. ALL COMMERCIAL USE, AND ALL USE BY FOR PROFIT ENTITIES, IS EXPRESSLY
 * PROHIBITED WITHOUT A LICENSE FROM SIMPLESCALAR, LLC (info@simplescalar.com).
 * 
 * 4. No nonprofit user may place any restrictions on the use of this software,
 * including as modified by the user, by any other authorized user.
 * 
 * 5. Noncommercial and nonprofit users may distribute copies of SimpleScalar
 * in compiled or executable form as set forth in Section 2, provided that
 * either: (A) it is accompanied by the corresponding machine-readable source
 * code, or (B) it is accompanied by a written offer, with no time limit, to
 * give anyone a machine-readable copy of the corresponding source code in
 * return for reimbursement of the cost of distribution. This written offer
 * must permit verbatim duplication by anyone, or (C) it is distributed by
 * someone who received only the executable form, and is accompanied by a
 * copy of the written offer of source code.
 * 
 * 6. SimpleScalar was developed by Todd M. Austin, Ph.D. The tool suite is
 * currently maintained by SimpleScalar LLC (info@simplescalar.com). US Mail:
 * 2395 Timbercrest Court, Ann Arbor, MI 48105.
 * 
 * Copyright (C) 1994-2003 by Todd M. Austin, Ph.D. and SimpleScalar, LLC.
 */


#include <stdio.h>
#include <stdlib.h>

#include "host.h"
#include "misc.h"
#include "machine.h"
#include "endian.h"
#include "regs.h"
#include "memory.h"
#include "sim.h"
#include "eio.h"
#include "loader.h"

#ifdef BFD_LOADER
#include <bfd.h>
#else /* !BFD_LOADER */
#include "target-alpha/ecoff.h"
#include "target-alpha/elf.h"
#endif /* BFD_LOADER */

/* amount of tail padding added to all loaded text segments */
#define TEXT_TAIL_PADDING 0 /* was: 128 */

/* program text (code) segment base */
//md_addr_t ld_text_base = 0;

/* program text (code) size in bytes */
//unsigned int ld_text_size = 0;

/* program initialized data segment base */
//md_addr_t ld_data_base = 0;

/* top of the data segment */
//md_addr_t ld_brk_point = 0;

/* program initialized ".data" and uninitialized ".bss" size in bytes */
//unsigned int ld_data_size = 0;

/* program stack segment base (highest address in stack) */
//md_addr_t ld_stack_base = 0;

/* program initial stack size */
//unsigned int ld_stack_size = 0;

/* lowest address accessed on the stack */
//md_addr_t ld_stack_min = -1;

/* program file name */
//char *ld_prog_fname = NULL;

/* program entry point (initial PC) */
//md_addr_t ld_prog_entry = 0;

/* program environment base address address */
//md_addr_t ld_environ_base = 0;

/* target executable endian-ness, non-zero if big endian */
//int ld_target_big_endian;

/* register simulator-specific statistics */
void
ld_reg_stats(struct stat_sdb_t *sdb, struct mem_t* mem)	/* stats data base */
{
  stat_reg_addr(sdb, "ld_text_base",
		"program text (code) segment base",
		&mem->ld_text_base, mem->ld_text_base, "0x%010p");
  stat_reg_uint(sdb, "mem->ld_text_size",
		"program text (code) size in bytes",
		&mem->ld_text_size, mem->ld_text_size, NULL);
  stat_reg_addr(sdb, "mem->ld_data_base",
		"program initialized data segment base",
		&mem->ld_data_base, mem->ld_data_base, "0x%010p");
  stat_reg_uint(sdb, "mem->ld_data_size",
		"program init'ed `.data' and uninit'ed `.bss' size in bytes",
		&mem->ld_data_size, mem->ld_data_size, NULL);
  stat_reg_addr(sdb, "mem->ld_stack_base",
		"program stack segment base (highest address in stack)",
		&mem->ld_stack_base, mem->ld_stack_base, "0x%010p");
#if 0 /* FIXME: broken... */
  stat_reg_addr(sdb, "mem->ld_stack_min",
		"program stack segment lowest address",
		&mem->ld_stack_min, mem->ld_stack_min, "0x%010p");
#endif
  stat_reg_uint(sdb, "mem->ld_stack_size",
		"program initial stack size",
		&mem->ld_stack_size, mem->ld_stack_size, NULL);
  stat_reg_addr(sdb, "mem->ld_prog_entry",
		"program entry point (initial PC)",
		&mem->ld_prog_entry, mem->ld_prog_entry, "0x%010p");
  stat_reg_addr(sdb, "mem->ld_environ_base",
		"program environment base address address",
		&mem->ld_environ_base, mem->ld_environ_base, "0x%010p");
  stat_reg_int(sdb, "mem->ld_target_big_endian",
	       "target executable endian-ness, non-zero if big endian",
	       &mem->ld_target_big_endian, mem->ld_target_big_endian, NULL);
}

#ifndef BFD_LOADER

/* detect if file is ELF format */
static int
is_elf_file(FILE *fobj)
{
  unsigned char e_ident[EI_NIDENT];
  long pos = ftell(fobj);
  
  if (fread(e_ident, EI_NIDENT, 1, fobj) < 1) {
    fseek(fobj, pos, SEEK_SET);
    return 0;
  }
  
  fseek(fobj, pos, SEEK_SET);
  
  return (e_ident[EI_MAG0] == ELFMAG0 &&
          e_ident[EI_MAG1] == ELFMAG1 &&
          e_ident[EI_MAG2] == ELFMAG2 &&
          e_ident[EI_MAG3] == ELFMAG3);
}

/* load ELF binary */
static void
load_elf_binary(FILE *fobj, char *fname, struct regs_t *regs, 
                struct mem_t *mem, int zero_bss_segs)
{
  Elf64_Ehdr ehdr;
  Elf64_Phdr *phdrs;
  Elf64_Shdr *shdrs;
  char *section_strtab = NULL;
  int i;
  md_addr_t data_break = 0;

  /* read ELF header */
  if (fread(&ehdr, sizeof(Elf64_Ehdr), 1, fobj) < 1)
    fatal("cannot read ELF header from executable `%s'", fname);

  /* verify it's a 64-bit Alpha ELF file */
  if (ehdr.e_ident[EI_CLASS] != ELFCLASS64)
    fatal("not a 64-bit ELF file: `%s'", fname);
  
  if (ehdr.e_machine != EM_ALPHA)
    fatal("not an Alpha ELF file: `%s'", fname);
    
  if (ehdr.e_type != ET_EXEC)
    fatal("not an executable ELF file: `%s'", fname);

  /* determine endianness */
  mem->ld_target_big_endian = (ehdr.e_ident[EI_DATA] == ELFDATA2MSB);

  /* set entry point */
  mem->ld_prog_entry = ehdr.e_entry;

  /* read program headers */
  if (ehdr.e_phnum > 0) {
    phdrs = calloc(ehdr.e_phnum, sizeof(Elf64_Phdr));
    if (!phdrs)
      fatal("out of memory");
    
    if (fseek(fobj, ehdr.e_phoff, SEEK_SET) != 0)
      fatal("cannot seek to program header table in `%s'", fname);
    
    if (fread(phdrs, sizeof(Elf64_Phdr), ehdr.e_phnum, fobj) < ehdr.e_phnum)
      fatal("cannot read program header table from `%s'", fname);

    /* process program headers (segments) */
    for (i = 0; i < ehdr.e_phnum; i++) {
      if (phdrs[i].p_type == PT_LOAD && phdrs[i].p_filesz > 0) {
        char *segment_data = calloc(phdrs[i].p_filesz, 1);
        if (!segment_data)
          fatal("out of memory");

        /* read segment data */
        if (fseek(fobj, phdrs[i].p_offset, SEEK_SET) != 0)
          fatal("cannot seek to segment data in `%s'", fname);
        
        if (fread(segment_data, phdrs[i].p_filesz, 1, fobj) < 1)
          fatal("cannot read segment data from `%s'", fname);

        /* copy segment to memory */
        mem_bcopy(mem_access, mem, Write, phdrs[i].p_vaddr, 
                  segment_data, phdrs[i].p_filesz);

        /* zero out any additional memory if memsz > filesz */
        if (phdrs[i].p_memsz > phdrs[i].p_filesz) {
          mem_bzero(mem_access, mem,
                    phdrs[i].p_vaddr + phdrs[i].p_filesz,
                    phdrs[i].p_memsz - phdrs[i].p_filesz);
        }

        /* determine if this is text or data */
        if (phdrs[i].p_flags & PF_X) {
          /* executable segment - text */
          if (mem->ld_text_base == 0) {
            mem->ld_text_base = phdrs[i].p_vaddr;
            mem->ld_text_size = phdrs[i].p_memsz + TEXT_TAIL_PADDING;
          }
        } else if (phdrs[i].p_flags & PF_W) {
          /* writable segment - data */
          if (mem->ld_data_base == 0) {
            mem->ld_data_base = phdrs[i].p_vaddr;
          }
          if (phdrs[i].p_vaddr + phdrs[i].p_memsz > data_break)
            data_break = phdrs[i].p_vaddr + phdrs[i].p_memsz;
        }

        free(segment_data);
      }
    }
    
    free(phdrs);
  }

  /* read section headers for additional information */
  if (ehdr.e_shnum > 0) {
    shdrs = calloc(ehdr.e_shnum, sizeof(Elf64_Shdr));
    if (!shdrs)
      fatal("out of memory");
    
    if (fseek(fobj, ehdr.e_shoff, SEEK_SET) != 0)
      fatal("cannot seek to section header table in `%s'", fname);
    
    if (fread(shdrs, sizeof(Elf64_Shdr), ehdr.e_shnum, fobj) < ehdr.e_shnum)
      fatal("cannot read section header table from `%s'", fname);

    /* read section string table if present */
    if (ehdr.e_shstrndx != 0 && ehdr.e_shstrndx < ehdr.e_shnum) {
      Elf64_Shdr *strtab_shdr = &shdrs[ehdr.e_shstrndx];
      if (strtab_shdr->sh_size > 0) {
        section_strtab = calloc(strtab_shdr->sh_size, 1);
        if (section_strtab) {
          if (fseek(fobj, strtab_shdr->sh_offset, SEEK_SET) == 0) {
            fread(section_strtab, strtab_shdr->sh_size, 1, fobj);
          }
        }
      }
    }

    /* process sections for better text/data classification */
    for (i = 0; i < ehdr.e_shnum; i++) {
      char *section_name = "";
      
      if (section_strtab && shdrs[i].sh_name < shdrs[ehdr.e_shstrndx].sh_size) {
        section_name = section_strtab + shdrs[i].sh_name;
      }

      /* handle specific section types */
      if (shdrs[i].sh_flags & SHF_ALLOC) {
        if (shdrs[i].sh_type == SHT_PROGBITS) {
          if (shdrs[i].sh_flags & SHF_EXECINSTR) {
            /* text section */
            if (mem->ld_text_base == 0) {
              mem->ld_text_base = shdrs[i].sh_addr;
              mem->ld_text_size = shdrs[i].sh_size + TEXT_TAIL_PADDING;
            }
          } else if (shdrs[i].sh_flags & SHF_WRITE) {
            /* data section */
            if (mem->ld_data_base == 0) {
              mem->ld_data_base = shdrs[i].sh_addr;
            }
            if (shdrs[i].sh_addr + shdrs[i].sh_size > data_break)
              data_break = shdrs[i].sh_addr + shdrs[i].sh_size;
          }
        } else if (shdrs[i].sh_type == SHT_NOBITS) {
          /* BSS section */
          if (zero_bss_segs) {
            mem_bzero(mem_access, mem, shdrs[i].sh_addr, shdrs[i].sh_size);
          }
          if (shdrs[i].sh_addr + shdrs[i].sh_size > data_break)
            data_break = shdrs[i].sh_addr + shdrs[i].sh_size;
        }
      }
    }

    if (section_strtab)
      free(section_strtab);
    free(shdrs);
  }

  /* set data size */
  if (mem->ld_data_base > 0 && data_break > mem->ld_data_base) {
    mem->ld_data_size = data_break - mem->ld_data_base;
  }

  /* set default values if not found */
  if (mem->ld_text_base == 0) {
    mem->ld_text_base = MD_TEXT_BASE;
    mem->ld_text_size = 0;
  }
  if (mem->ld_data_base == 0) {
    mem->ld_data_base = MD_DATA_BASE;
    mem->ld_data_size = 0;
  }
}

#endif /* !BFD_LOADER */


/* load program text and initialized data into simulated virtual memory
   space and initialize program segment range variables */
void
ld_load_prog(char *fname,		/* program to load */
	     int argc, char **argv,	/* simulated program cmd line args */
	     char **envp,		/* simulated program environment */
	     struct regs_t *regs,	/* registers to initialize for load */
	     struct mem_t *mem,		/* memory space to load prog into */
	     int zero_bss_segs)		/* zero uninit data segment? */
{
  int i;
  qword_t temp;
  md_addr_t sp, data_break = 0, null_ptr = 0, argv_addr, envp_addr;
  fprintf(stderr,"sim: loading binary...\n");
  if (eio_valid(fname))
    {
      if (argc != 1)
	{
	  fprintf(stderr, "error: EIO file has arguments\n");
	  exit(1);
	}
     
      fprintf(stderr, "sim: loading EIO file: %s\n", fname);
     
      sim_eio_fname = mystrdup(fname);
     
      /* open the EIO file stream */
      sim_eio_fd = eio_open(fname);
     
      /* load initial state checkpoint */
      if (eio_read_chkpt(regs, mem, sim_eio_fd) != -1)
	fatal("bad initial checkpoint in EIO file");
     
      /* load checkpoint? */
      if (sim_chkpt_fname != NULL)
	{
	  counter_t restore_icnt;
	 
	  FILE *chkpt_fd;
	  
	  fprintf(stderr, "sim: loading checkpoint file: %s\n",
		  sim_chkpt_fname);
	  
	  if (!eio_valid(sim_chkpt_fname))
	    fatal("file `%s' does not appear to be a checkpoint file",
		  sim_chkpt_fname);
	  
	  /* open the checkpoint file */
	  chkpt_fd = eio_open(sim_chkpt_fname);
	  
	  /* load the state image */
	  restore_icnt = eio_read_chkpt(regs, mem, chkpt_fd);
	  
	  /* fast forward the baseline EIO trace to checkpoint location */
	  myfprintf(stderr, "sim: fast forwarding to instruction %n\n",
		    restore_icnt);
	  eio_fast_forward(sim_eio_fd, restore_icnt);
	}

      /* computed state... */
      mem->ld_environ_base = regs->regs_R[MD_REG_SP];
      mem->ld_prog_entry = regs->regs_PC;

      /* fini... */
      return;
    }
#ifdef MD_CROSS_ENDIAN
  else
    {
      warn("endian of `%s' does not match host", fname);
      warn("running with experimental cross-endian execution support");
      warn("****************************************");
      warn("**>> please check results carefully <<**");
      warn("****************************************");
#if 0
      fatal("SimpleScalar/Alpha only supports binary execution on\n"
	    "       little-endian hosts, use EIO files on big-endian hosts");
#endif
    }
#endif /* MD_CROSS_ENDIAN */

  if (sim_chkpt_fname != NULL)
    fatal("checkpoints only supported while EIO tracing");

#ifdef BFD_LOADER

  {
    bfd *abfd;
    asection *sect;

    /* set up a local stack pointer, this is where the argv and envp
       data is written into program memory */
    mem->ld_stack_base = MD_STACK_BASE;
    sp = ROUND_DOWN(MD_STACK_BASE - MD_MAX_ENVIRON, sizeof(MD_DOUBLE_TYPE));
    mem->ld_stack_size = mem->ld_stack_base - sp;

    /* initial stack pointer value */
    mem->ld_environ_base = sp;

    /* load the program into memory, try both endians */
    if (!(abfd = bfd_openr(argv[0], "ss-coff-big")))
      if (!(abfd = bfd_openr(argv[0], "ss-coff-little")))
	fatal("cannot open executable `%s'", argv[0]);

    /* this call is mainly for its side effect of reading in the sections.
       we follow the traditional behavior of `strings' in that we don't
       complain if we don't recognize a file to be an object file.  */
    if (!bfd_check_format(abfd, bfd_object))
      {
	bfd_close(abfd);
	fatal("cannot open executable `%s'", argv[0]);
      }

    /* record profile file name */
    mem->ld_prog_fname = argv[0];

    /* record endian of target */
    mem->ld_target_big_endian = abfd->xvec->byteorder_big_p;

    debug("processing %d sections in `%s'...",
	  bfd_count_sections(abfd), argv[0]);

    /* read all sections in file */
    for (sect=abfd->sections; sect; sect=sect->next)
      {
	char *p;

	debug("processing section `%s', %d bytes @ 0x%08x...",
	      bfd_section_name(abfd, sect), bfd_section_size(abfd, sect),
	      bfd_section_vma(abfd, sect));

	/* read the section data, if allocated and loadable and non-NULL */
	if ((bfd_get_section_flags(abfd, sect) & SEC_ALLOC)
	    && (bfd_get_section_flags(abfd, sect) & SEC_LOAD)
	    && bfd_section_vma(abfd, sect)
	    && bfd_section_size(abfd, sect))
	  {
	    /* allocate a section buffer */
	    p = calloc(bfd_section_size(abfd, sect), sizeof(char));
	    if (!p)
	      fatal("cannot allocate %d bytes for section `%s'",
		    bfd_section_size(abfd, sect),
		    bfd_section_name(abfd, sect));

	    if (!bfd_get_section_contents(abfd, sect, p, (file_ptr)0,
					  bfd_section_size(abfd, sect)))
	      fatal("could not read entire `%s' section from executable",
		    bfd_section_name(abfd, sect));

	    /* copy program section it into simulator target memory */
	    mem_bcopy(mem_fn, Write, bfd_section_vma(abfd, sect),
		      p, bfd_section_size(abfd, sect));

	    /* release the section buffer */
	    free(p);
	  }
	/* zero out the section if it is loadable but not allocated in exec */
	else if (zero_bss_segs
		 && (bfd_get_section_flags(abfd, sect) & SEC_LOAD)
		 && bfd_section_vma(abfd, sect)
		 && bfd_section_size(abfd, sect))
	  {
	    /* zero out the section region */
	    mem_bzero(mem_fn,
		      bfd_section_vma(abfd, sect),
		      bfd_section_size(abfd, sect));
	  }
	else
	  {
	    /* else do nothing with this section, it's probably debug data */
	    debug("ignoring section `%s' during load...",
		  bfd_section_name(abfd, sect));
	  }

	/* expected text section */
	if (!strcmp(bfd_section_name(abfd, sect), ".text"))
	  {
	    /* .text section processing */
	    mem->ld_text_size =
	      ((bfd_section_vma(abfd, sect) + bfd_section_size(abfd, sect))
	       - MD_TEXT_BASE)
		+ /* for speculative fetches/decodes */TEXT_TAIL_PADDING;

	    /* create tail padding and copy into simulator target memory */
#if 0
	    mem_bzero(mem_fn,
		      bfd_section_vma(abfd, sect)
		      + bfd_section_size(abfd, sect),
		      TEXT_TAIL_PADDING);
#endif
	  }
	/* expected data sections */
	else if (!strcmp(bfd_section_name(abfd, sect), ".rdata")
		 || !strcmp(bfd_section_name(abfd, sect), ".data")
		 || !strcmp(bfd_section_name(abfd, sect), ".sdata")
		 || !strcmp(bfd_section_name(abfd, sect), ".bss")
		 || !strcmp(bfd_section_name(abfd, sect), ".sbss"))
	  {
	    /* data section processing */
	    if (bfd_section_vma(abfd, sect) + bfd_section_size(abfd, sect) >
		data_break)
	      data_break = (bfd_section_vma(abfd, sect) +
			    bfd_section_size(abfd, sect));
	  }
	else
	  {
	    /* what is this section??? */
	    fatal("encountered unknown section `%s', %d bytes @ 0x%08x",
		  bfd_section_name(abfd, sect), bfd_section_size(abfd, sect),
		  bfd_section_vma(abfd, sect));
	  }
      }

    /* compute data segment size from data break point */
    mem->ld_text_base = MD_TEXT_BASE;
    mem->ld_data_base = MD_DATA_BASE;
    mem->ld_prog_entry = bfd_get_start_address(abfd);
    mem->ld_data_size = data_break - mem->ld_data_base;

    /* done with the executable, close it */
    if (!bfd_close(abfd))
      fatal("could not close executable `%s'", argv[0]);
  }

#else /* !BFD_LOADER, i.e., standalone loader */

  {
    FILE *fobj;
    long floc;
    struct ecoff_filehdr fhdr;
    struct ecoff_aouthdr ahdr;
    struct ecoff_scnhdr shdr;

    /* record profile file name */
    mem->ld_prog_fname = argv[0];
    fprintf(stderr, "sim: loading %s\n", mem->ld_prog_fname);
    /* load the program into memory, try both endians */
#if defined(__CYGWIN32__) || defined(_MSC_VER)
    fobj = fopen(argv[0], "rb");
#else
    fobj = fopen(argv[0], "r");
#endif
    if (!fobj)
      fatal("cannot open executable `%s'", argv[0]);

    /* detect file format - ELF or ECOFF */
    if (is_elf_file(fobj)) {
      fprintf(stderr, "sim: detected ELF format\n");
      load_elf_binary(fobj, argv[0], regs, mem, zero_bss_segs);
      
      /* close the file */
      if (fclose(fobj))
        fatal("could not close executable `%s'", argv[0]);
    } else {
      /* try ECOFF format */
      fprintf(stderr, "sim: trying ECOFF format\n");
      
      if (fread(&fhdr, sizeof(struct ecoff_filehdr), 1, fobj) < 1)
        fatal("cannot read header from executable `%s'", argv[0]);

      /* record endian of target */
      if (fhdr.f_magic == MD_SWAPH(ECOFF_ALPHAMAGIC))
        mem->ld_target_big_endian = FALSE;
      else if (fhdr.f_magic == MD_SWAPH(ECOFF_EB_MAGIC)
               || fhdr.f_magic == MD_SWAPH(ECOFF_EL_MAGIC)
               || fhdr.f_magic == MD_SWAPH(ECOFF_EB_OTHER)
               || fhdr.f_magic == MD_SWAPH(ECOFF_EL_OTHER))
        fatal("Alpha simulator cannot run PISA binary `%s'", argv[0]);
      else
        fatal("bad magic number in executable `%s' (not a recognized executable format)", argv[0]);

      if (fread(&ahdr, sizeof(struct ecoff_aouthdr), 1, fobj) < 1)
        fatal("cannot read AOUT header from executable `%s'", argv[0]);

      mem->ld_text_base = MD_SWAPQ(ahdr.text_start);
      mem->ld_text_size = MD_SWAPQ(ahdr.tsize);
      mem->ld_prog_entry = MD_SWAPQ(ahdr.entry);
      mem->ld_data_base = MD_SWAPQ(ahdr.data_start);
      mem->ld_data_size = MD_SWAPQ(ahdr.dsize) + MD_SWAPQ(ahdr.bsize);
      regs->regs_R[MD_REG_GP] = MD_SWAPQ(ahdr.gp_value);

    /* compute data segment size from data break point */
    data_break = mem->ld_data_base + mem->ld_data_size;

    /* seek to the beginning of the first section header, the file header comes
       first, followed by the optional header (this is the aouthdr), the size
       of the aouthdr is given in Fdhr.f_opthdr */
    fseek(fobj, sizeof(struct ecoff_filehdr) + MD_SWAPH(fhdr.f_opthdr), 0);

    debug("processing %d sections in `%s'...",
	  MD_SWAPH(fhdr.f_nscns), argv[0]);

    /* loop through the section headers */
    floc = ftell(fobj);
    for (i = 0; i < MD_SWAPH(fhdr.f_nscns); i++)
      {
	char *p;

	if (fseek(fobj, floc, 0) == -1)
	  fatal("could not reset location in executable");
	if (fread(&shdr, sizeof(struct ecoff_scnhdr), 1, fobj) < 1)
	  fatal("could not read section %d from executable", i);
	floc = ftell(fobj);

	switch (MD_SWAPW(shdr.s_flags))
	  {
	  case ECOFF_STYP_TEXT:
	    p = calloc(MD_SWAPQ(shdr.s_size), sizeof(char));
	    if (!p)
	      fatal("out of virtual memory");

	    if (fseek(fobj, MD_SWAPQ(shdr.s_scnptr), 0) == -1)
	      fatal("could not read `.text' from executable", i);
	    if (fread(p, MD_SWAPQ(shdr.s_size), 1, fobj) < 1)
	      fatal("could not read text section from executable");

	    /* copy program section into simulator target memory */
	    mem_bcopy(mem_access, mem, Write,
		      MD_SWAPQ(shdr.s_vaddr), p, MD_SWAPQ(shdr.s_size));

#if 0
	    /* create tail padding and copy into simulator target memory */
	    mem_bzero(mem_access, mem,
		      MD_SWAPQ(shdr.s_vaddr) + MD_SWAPQ(shdr.s_size),
		      TEXT_TAIL_PADDING);
#endif

	    /* release the section buffer */
	    free(p);

#if 0
	    Text_seek = MD_SWAPQ(shdr.s_scnptr);
	    Text_start = MD_SWAPQ(shdr.s_vaddr);
	    Text_size = MD_SWAPQ(shdr.s_size) / 4;
	    /* there is a null routine after the supposed end of text */
	    Text_size += 10;
	    Text_end = Text_start + Text_size * 4;
	    /* create_text_reloc(shdr.s_relptr, shdr.s_nreloc); */
#endif
	    break;

	  case ECOFF_STYP_INIT:
	  case ECOFF_STYP_FINI:
	    if (MD_SWAPQ(shdr.s_size) > 0)
	      {
		p = calloc(MD_SWAPQ(shdr.s_size), sizeof(char));
		if (!p)
		  fatal("out of virtual memory");
		
		if (fseek(fobj, MD_SWAPQ(shdr.s_scnptr), 0) == -1)
		  fatal("could not read `.text' from executable", i);
		if (fread(p, MD_SWAPQ(shdr.s_size), 1, fobj) < 1)
		  fatal("could not read text section from executable");
		
		/* copy program section into simulator target memory */
		mem_bcopy(mem_access, mem,
			  Write, MD_SWAPQ(shdr.s_vaddr),
			  p, MD_SWAPQ(shdr.s_size));
		
		/* release the section buffer */
		free(p);
	      }
	    else
	      warn("section `%s' is empty...", shdr.s_name);
	    break;

	  case ECOFF_STYP_LITA:
	  case ECOFF_STYP_LIT8:
	  case ECOFF_STYP_LIT4:
	  case ECOFF_STYP_XDATA:
	  case ECOFF_STYP_PDATA:
	  case ECOFF_STYP_RCONST:
	    /* fall through */

	  case ECOFF_STYP_RDATA:
	    /* The .rdata section is sometimes placed before the text
	     * section instead of being contiguous with the .data section.
	     */
#if 0
	    Rdata_start = MD_SWAPQ(shdr.s_vaddr);
	    Rdata_size = MD_SWAPQ(shdr.s_size);
	    Rdata_seek = MD_SWAPQ(shdr.s_scnptr);
#endif
	    /* fall through */
	  case ECOFF_STYP_DATA:
#if 0
	    Data_seek = MD_SWAPQ(shdr.s_scnptr);
#endif
	    /* fall through */
	  case ECOFF_STYP_SDATA:
#if 0
	    Sdata_seek = MD_SWAPQ(shdr.s_scnptr);
#endif
	    if (MD_SWAPQ(shdr.s_size) > 0)
	      {
		p = calloc(MD_SWAPQ(shdr.s_size), sizeof(char));
		if (!p)
		  fatal("out of virtual memory");

		if (fseek(fobj, MD_SWAPQ(shdr.s_scnptr), 0) == -1)
		  fatal("could not read `.text' from executable", i);
		if (fread(p, MD_SWAPQ(shdr.s_size), 1, fobj) < 1)
		  fatal("could not read text section from executable");

		/* copy program section it into simulator target memory */
		mem_bcopy(mem_access, mem,
			  Write, MD_SWAPQ(shdr.s_vaddr),
			  p, MD_SWAPQ(shdr.s_size));

		/* release the section buffer */
		free(p);
	      }
	    else
	      warn("section `%s' is empty...", shdr.s_name);
	  break;

	  case ECOFF_STYP_BSS:
	  case ECOFF_STYP_SBSS:
	    /* no data to read... */
	    break;

	  default:
	    warn("section `%s' ignored...", shdr.s_name);
	  }
      }

      /* done with the executable, close it */
      if (fclose(fobj))
        fatal("could not close executable `%s'", argv[0]);
    } /* end ECOFF loading */
  }

#endif /* BFD_LOADER */

  /* perform sanity checks on segment ranges */
  if (!mem->ld_text_base || !mem->ld_text_size)
    fatal("executable is missing a `.text' section");
  /* Note: .data section is optional for simple programs */
  if (!mem->ld_prog_entry)
    fatal("program entry point not specified");

  /* determine byte/words swapping required to execute on this host */
  sim_swap_bytes = (endian_host_byte_order() != endian_target_byte_order(mem->ld_target_big_endian));
  if (sim_swap_bytes)
    {
#if 0 /* FIXME: disabled until further notice... */
      /* cross-endian is never reliable, why this is so is beyond the scope
	 of this comment, e-mail me for details... */
      fprintf(stderr, "sim: *WARNING*: swapping bytes to match host...\n");
      fprintf(stderr, "sim: *WARNING*: swapping may break your program!\n");
      /* #else */
      fatal("binary endian does not match host endian");
#endif
    }
  sim_swap_words = (endian_host_word_order() != endian_target_word_order(mem->ld_target_big_endian));
  if (sim_swap_words)
    {
#if 0 /* FIXME: disabled until further notice... */
      /* cross-endian is never reliable, why this is so is beyond the scope
	 of this comment, e-mail me for details... */
      fprintf(stderr, "sim: *WARNING*: swapping words to match host...\n");
      fprintf(stderr, "sim: *WARNING*: swapping may break your program!\n");
      /* #else */
      fatal("binary endian does not match host endian");
#endif
    }

  /* set up a local stack pointer, this is where the argv and envp
     data is written into program memory */
  mem->ld_stack_base = mem->ld_text_base - (409600+4096);
#if 0
  sp = ROUND_DOWN(mem->ld_stack_base - MD_MAX_ENVIRON, sizeof(MD_DOUBLE_TYPE));
#endif
  sp = mem->ld_stack_base - MD_MAX_ENVIRON;
  mem->ld_stack_size = mem->ld_stack_base - sp;

  /* initial stack pointer value */
  mem->ld_environ_base = sp;

  /* write [argc] to stack */
  temp = MD_SWAPQ(argc);
  mem_access(mem, Write, sp, &temp, sizeof(qword_t));
  regs->regs_R[MD_REG_A0] = temp;
  sp += sizeof(qword_t);

  /* skip past argv array and NULL */
  argv_addr = sp;
  regs->regs_R[MD_REG_A1] = argv_addr;
  sp = sp + (argc + 1) * sizeof(md_addr_t);

  /* save space for envp array and NULL */
  envp_addr = sp;
  for (i=0; envp[i]; i++)
    sp += sizeof(md_addr_t);
  sp += sizeof(md_addr_t);

  /* fill in the argv pointer array and data */
  for (i=0; i<argc; i++)
    {
      /* write the argv pointer array entry */
      temp = MD_SWAPQ(sp);
      mem_access(mem, Write, argv_addr + i*sizeof(md_addr_t),
		 &temp, sizeof(md_addr_t));
      /* and the data */
      mem_strcpy(mem_access, mem, Write, sp, argv[i]);
      sp += strlen(argv[i])+1;
    }
  /* terminate argv array with a NULL */
  mem_access(mem, Write, argv_addr + i*sizeof(md_addr_t),
	     &null_ptr, sizeof(md_addr_t));

  /* write envp pointer array and data to stack */
  for (i = 0; envp[i]; i++)
    {
      /* write the envp pointer array entry */
      temp = MD_SWAPQ(sp);
      mem_access(mem, Write, envp_addr + i*sizeof(md_addr_t),
		 &temp, sizeof(md_addr_t));
      /* and the data */
      mem_strcpy(mem_access, mem, Write, sp, envp[i]);
      sp += strlen(envp[i]) + 1;
    }
  /* terminate the envp array with a NULL */
  mem_access(mem, Write, envp_addr + i*sizeof(md_addr_t),
	     &null_ptr, sizeof(md_addr_t));

  /* did we tromp off the stop of the stack? */
  if (sp > mem->ld_stack_base)
    {
      /* we did, indicate to the user that MD_MAX_ENVIRON must be increased,
	 alternatively, you can use a smaller environment, or fewer
	 command line arguments */
      fatal("environment overflow, increase MD_MAX_ENVIRON in alpha.h");
    }

  /* initialize the bottom of heap to top of data segment */
  mem->ld_brk_point = ROUND_UP(mem->ld_data_base + mem->ld_data_size, MD_PAGE_SIZE);

  /* set initial minimum stack pointer value to initial stack value */
  mem->ld_stack_min = regs->regs_R[MD_REG_SP];

  regs->regs_R[MD_REG_SP] = mem->ld_environ_base;
  regs->regs_PC = mem->ld_prog_entry;

  debug("mem->ld_text_base: 0x%08x  mem->ld_text_size: 0x%08x",
	mem->ld_text_base, mem->ld_text_size);
  debug("mem->ld_data_base: 0x%08x  mem->ld_data_size: 0x%08x",
	mem->ld_data_base, mem->ld_data_size);
  debug("mem->ld_stack_base: 0x%08x  mem->ld_stack_size: 0x%08x",
	mem->ld_stack_base, mem->ld_stack_size);
  debug("mem->ld_prog_entry: 0x%08x", mem->ld_prog_entry);
}
