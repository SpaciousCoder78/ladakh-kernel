/*Assembly boot variables and bootstrap code for Ladakh Kernel
        File Name: boot.s
        Authors: Aryan Karamtoth
        Last Revision: 13 Dec 2024
        Version: 1.0
        License: GNU GPL 3.0
*/

/*constant declaration for multiboot header */

.set ALIGN, 1<<0 /*align loaded modules on page boundaries */
.set MEMINFO, 1<<1 /*provide memory map */
.set FLAGS, ALIGN | MEMINFO /*multiboot flag field */
.set MAGIC, 0x1BADB002 /* enables bootloader to find the header*/
.set CHECKSUM, -(MAGIC + FLAGS) /*checksum to prove multiboot */


