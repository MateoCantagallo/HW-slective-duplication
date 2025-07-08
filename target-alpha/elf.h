/* elf.h - ELF (Executable and Linkable Format) definitions for Alpha */

/* ELF support for SimpleScalar Alpha simulator */

#ifndef ELF_H
#define ELF_H

#include <stdint.h>

/* ELF identification bytes */
#define EI_NIDENT 16

/* ELF magic number */
#define ELFMAG0    0x7f
#define ELFMAG1    'E'
#define ELFMAG2    'L'
#define ELFMAG3    'F'
#define ELFMAG     "\177ELF"
#define SELFMAG    4

/* e_ident[] indexes */
#define EI_MAG0     0  /* File identification byte 0 index */
#define EI_MAG1     1  /* File identification byte 1 index */
#define EI_MAG2     2  /* File identification byte 2 index */
#define EI_MAG3     3  /* File identification byte 3 index */
#define EI_CLASS    4  /* File class byte index */
#define EI_DATA     5  /* Data encoding byte index */
#define EI_VERSION  6  /* File version byte index */
#define EI_OSABI    7  /* OS/ABI identification */
#define EI_ABIVERSION 8 /* ABI version */
#define EI_PAD      9  /* Byte index of padding bytes */

/* File classes */
#define ELFCLASSNONE 0  /* Invalid class */
#define ELFCLASS32   1  /* 32-bit objects */
#define ELFCLASS64   2  /* 64-bit objects */

/* Data encodings */
#define ELFDATANONE  0  /* Invalid data encoding */
#define ELFDATA2LSB  1  /* Little endian */
#define ELFDATA2MSB  2  /* Big endian */

/* File types */
#define ET_NONE   0    /* No file type */
#define ET_REL    1    /* Relocatable file */
#define ET_EXEC   2    /* Executable file */
#define ET_DYN    3    /* Shared object file */
#define ET_CORE   4    /* Core file */

/* Machine types */
#define EM_NONE     0   /* No machine */
#define EM_ALPHA    0x9026  /* Alpha */

/* ELF header (64-bit) */
typedef struct {
    unsigned char e_ident[EI_NIDENT]; /* Magic number and other info */
    uint16_t      e_type;             /* Object file type */
    uint16_t      e_machine;          /* Architecture */
    uint32_t      e_version;          /* Object file version */
    uint64_t      e_entry;            /* Entry point virtual address */
    uint64_t      e_phoff;            /* Program header table file offset */
    uint64_t      e_shoff;            /* Section header table file offset */
    uint32_t      e_flags;            /* Processor-specific flags */
    uint16_t      e_ehsize;           /* ELF header size in bytes */
    uint16_t      e_phentsize;        /* Program header table entry size */
    uint16_t      e_phnum;            /* Program header table entry count */
    uint16_t      e_shentsize;        /* Section header table entry size */
    uint16_t      e_shnum;            /* Section header table entry count */
    uint16_t      e_shstrndx;         /* Section header string table index */
} Elf64_Ehdr;

/* Program header (64-bit) */
typedef struct {
    uint32_t      p_type;             /* Segment type */
    uint32_t      p_flags;            /* Segment flags */
    uint64_t      p_offset;           /* Segment file offset */
    uint64_t      p_vaddr;            /* Segment virtual address */
    uint64_t      p_paddr;            /* Segment physical address */
    uint64_t      p_filesz;           /* Segment size in file */
    uint64_t      p_memsz;            /* Segment size in memory */
    uint64_t      p_align;            /* Segment alignment */
} Elf64_Phdr;

/* Section header (64-bit) */
typedef struct {
    uint32_t      sh_name;            /* Section name (string tbl index) */
    uint32_t      sh_type;            /* Section type */
    uint64_t      sh_flags;           /* Section flags */
    uint64_t      sh_addr;            /* Section virtual addr at execution */
    uint64_t      sh_offset;          /* Section file offset */
    uint64_t      sh_size;            /* Section size in bytes */
    uint32_t      sh_link;            /* Link to another section */
    uint32_t      sh_info;            /* Additional section information */
    uint64_t      sh_addralign;       /* Section alignment */
    uint64_t      sh_entsize;         /* Entry size if section holds table */
} Elf64_Shdr;

/* Program header types */
#define PT_NULL     0    /* Program header table entry unused */
#define PT_LOAD     1    /* Loadable program segment */
#define PT_DYNAMIC  2    /* Dynamic linking information */
#define PT_INTERP   3    /* Program interpreter */
#define PT_NOTE     4    /* Auxiliary information */
#define PT_SHLIB    5    /* Reserved */
#define PT_PHDR     6    /* Entry for header table itself */

/* Section types */
#define SHT_NULL      0   /* Section header table entry unused */
#define SHT_PROGBITS  1   /* Program data */
#define SHT_SYMTAB    2   /* Symbol table */
#define SHT_STRTAB    3   /* String table */
#define SHT_RELA      4   /* Relocation entries with addends */
#define SHT_HASH      5   /* Symbol hash table */
#define SHT_DYNAMIC   6   /* Dynamic linking information */
#define SHT_NOTE      7   /* Notes */
#define SHT_NOBITS    8   /* Program space with no data (bss) */
#define SHT_REL       9   /* Relocation entries, no addends */

/* Section flags */
#define SHF_WRITE     0x1       /* Writable */
#define SHF_ALLOC     0x2       /* Occupies memory during execution */
#define SHF_EXECINSTR 0x4       /* Executable */

/* Program header flags */
#define PF_X        0x1         /* Executable */
#define PF_W        0x2         /* Writable */
#define PF_R        0x4         /* Readable */

#endif /* ELF_H */
