/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-LAN.aml, Thu Oct  5 12:05:31 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000062 (98)
 *     Revision         0x02
 *     Checksum         0x02
 *     OEM ID           "AWAN"
 *     OEM Table ID     "LAN"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "AWAN", "LAN", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_SB_.PCI0.RP06, DeviceObj)

    Scope (_SB.PCI0.RP06)
    {
        Device (PXSX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x09, 
                0x04
            })
        }
    }
}

