/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-HPET.aml, Sat Oct  7 12:03:56 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000013E (318)
 *     Revision         0x02
 *     Checksum         0x50
 *     OEM ID           "CORP"
 *     OEM Table ID     "HPET"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "CORP", "HPET", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.HPET.XCRS, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPCB.HPET.XSTA, MethodObj)    // 0 Arguments

    Scope (\_SB.PCI0.LPCB.HPET)
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8,11}
            Memory32Fixed (ReadWrite,
                0xFED00000,         // Address Base
                0x00000400,         // Address Length
                )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If (LOr (_OSI ("Darwin"), LNot (CondRefOf (\_SB.PCI0.LPCB.HPET.XCRS))))
            {
                Return (BUFX) /* \_SB_.PCI0.LPCB.HPET.BUFX */
            }

            Return (\_SB.PCI0.LPCB.HPET.XCRS ())
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (LOr (_OSI ("Darwin"), LNot (CondRefOf (\_SB.PCI0.LPCB.HPET.XSTA))))
            {
                Return (0x0F)
            }

            Return (\_SB.PCI0.LPCB.HPET.XSTA ())
        }
    }
}

