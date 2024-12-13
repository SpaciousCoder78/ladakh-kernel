/*Assembly boot variables and bootstrap code for Ladakh Kernel
        File Name: boot.s
        Authors: Aryan Karamtoth
        Last Revision: 13 Dec 2024
        Version: 1.0
        License: GNU GPL 3.0
*/

/* Declare constants for the multiboot header. */
.set ALIGN,    1<<0             /* align loaded modules on page boundaries */
.set MEMINFO,  1<<1             /* provide memory map */
.set FLAGS,    ALIGN | MEMINFO  /* this is the Multiboot 'flag' field */
.set MAGIC,    0x1BADB002       /* 'magic number' lets bootloader find the header */
.set CHECKSUM, -(MAGIC + FLAGS) /* checksum of above, to prove we are multiboot */

/*multiboot header to mark program as kernel */

.section .multiboot
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/*creating a small stack */
.section .bss
.align 16
stack_bottom:
.skip 16384 # 16 KiB
stack_top:

/*_start is definied as entry point once kernel is loaded */

.section .text
.global _start
.type _start, @function
_start:
	

	/*To use stack set esp reg to point to top of stack */

	mov $stack_top, %esp

	/*Enter high level kernel */

	call kernel_main

	/*Disable interrupts with cli , wait for interrupt to arrive at hlt and jump to hlt when required */

	cli
1:	hlt
	jmp 1b

/*Set size of _start to current loc minus start, usefu for call tracing */

.size _start, . - _start
