/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-USB.aml, Sat Oct  7 12:03:56 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000368 (872)
 *     Revision         0x02
 *     Checksum         0x36
 *     OEM ID           "AWAN"
 *     OEM Table ID     "USB"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "AWAN", "USB", 0x00000000)
{
    /*
     * External declarations were imported from
     * a reference file -- refs.txt
     */

    External (_SB_.PCI0.EH01, DeviceObj)
    External (_SB_.PCI0.EH02, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.RHUB, DeviceObj)

    Scope (_SB.PCI0.XHC.RHUB)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (0x0F)
            }
        }
    }

    Scope (_SB.PCI0.XHC)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x10)
            {
                "built-in", 
                Buffer (One)
                {
                     0x00                                             // .
                }, 

                "AAPL,clock-id", 
                Buffer (One)
                {
                     0x02                                             // .
                }, 

                "device_type", 
                Buffer (0x05)
                {
                    "XHCI"
                }, 

                "AAPL,current-available", 
                0x0834, 
                "AAPL,current-extra", 
                0x0898, 
                "AAPL,current-extra-in-sleep", 
                0x0640, 
                "AAPL,device-internal", 
                0x02, 
                "AAPL,max-port-current-in-sleep", 
                0x0834
            })
        }
    }

    Scope (_SB.PCI0.EH01)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x10)
            {
                "built-in", 
                Buffer (One)
                {
                     0x00                                             // .
                }, 

                "AAPL,clock-id", 
                Buffer (One)
                {
                     0x01                                             // .
                }, 

                "device_type", 
                Buffer (0x05)
                {
                    "EHCI"
                }, 

                "AAPL,current-available", 
                0x0834, 
                "AAPL,current-extra", 
                0x0898, 
                "AAPL,current-extra-in-sleep", 
                0x0640, 
                "AAPL,device-internal", 
                0x02, 
                "AAPL,max-port-current-in-sleep", 
                0x0834
            })
        }
    }

    Scope (_SB.PCI0.EH02)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (LEqual (Arg2, Zero))
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x10)
            {
                "built-in", 
                Buffer (One)
                {
                     0x00                                             // .
                }, 

                "AAPL,clock-id", 
                Buffer (One)
                {
                     0x01                                             // .
                }, 

                "device_type", 
                Buffer (0x05)
                {
                    "EHCI"
                }, 

                "AAPL,current-available", 
                0x0834, 
                "AAPL,current-extra", 
                0x0898, 
                "AAPL,current-extra-in-sleep", 
                0x0640, 
                "AAPL,device-internal", 
                0x02, 
                "AAPL,max-port-current-in-sleep", 
                0x0834
            })
        }
    }
}

