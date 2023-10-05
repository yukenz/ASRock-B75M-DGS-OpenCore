/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-LPCB.aml, Thu Oct  5 12:05:31 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000010A (266)
 *     Revision         0x02
 *     Checksum         0xD5
 *     OEM ID           "AWAN"
 *     OEM Table ID     "LPCBFix"
 *     OEM Revision     0x00000022 (34)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "AWAN", "LPCBFix", 0x00000022)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.SATA.SPT0, DeviceObj)

    Scope (_SB.PCI0.LPCB)
    {
        Device (MATH)
        {
            Name (_HID, EisaId ("PNP0C04") /* x87-compatible Floating Point Processing Unit */)  // _HID: Hardware ID
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x00F0,             // Range Minimum
                    0x00F0,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IRQNoFlags ()
                    {13}
            })
        }

        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x02)
            {
                "compatible", 
                Buffer (0x0D)
                {
                    "pci8086,1e44"
                }
            })
        }
    }

    Method (_SB.PCI0.SATA.SPT0._DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
    {
        If (LEqual (Arg2, Zero))
        {
            Return (Buffer (One)
            {
                 0x03                                             // .
            })
        }

        Return (Package (0x02)
        {
            "io-device-location", 
            Buffer (0x04)
            {
                "SSD"
            }
        })
    }
}

