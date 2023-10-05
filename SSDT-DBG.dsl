/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200528 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to non-symbolic legacy ASL operators
 *
 * Disassembly of SSDT-DBG.aml, Thu Oct  5 12:05:30 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000002F (47)
 *     Revision         0x01
 *     Checksum         0xC7
 *     OEM ID           "APPLE "
 *     OEM Table ID     "Debug"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 1, "APPLE ", "Debug", 0x00001000)
{
    Method (MDBG, 1, NotSerialized)
    {
        Store (Arg0, Debug)
    }
}

