/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-IMEI.aml, Thu Oct  5 12:05:31 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000000BC (188)
 *     Revision         0x02
 *     Checksum         0xB1
 *     OEM ID           "AWAN"
 *     OEM Table ID     "IMEI"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "AWAN", "IMEI", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.IMEI, DeviceObj)

    If (LAnd (LAnd (LNot (CondRefOf (\_SB.PCI0.IMEI)), LNot (CondRefOf (\_SB.PCI0.HECI))), LNot (
        CondRefOf (\_SB.PCI0.MEI))))
    {
        Scope (_SB.PCI0)
        {
            Device (IMEI)
            {
                Name (_ADR, 0x00160000)  // _ADR: Address
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}

