﻿// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace Microsoft.Finance.TaxEngine.JsonExchange;

using Microsoft.Finance.GST.Base;

codeunit 18011 "GST TDS TCS Tax Type Setup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Tax Engine Assisted Setup", 'OnSetupTaxTypes', '', false, false)]
    local procedure OnSetupTaxTypes()
    var
        GSTTDSTCSTaxTypeData: Codeunit "GST TDS TCS Tax Type Data";
        TaxJsonDeserialization: Codeunit "Tax Json Deserialization";
    begin
        TaxJsonDeserialization.HideDialog(true);
        TaxJsonDeserialization.SkipVersionCheck(true);
        TaxJsonDeserialization.ImportTaxTypes(GSTTDSTCSTaxTypeData.GetText());
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Tax Engine Assisted Setup", 'OnGetUseCaseConfig', '', false, false)]
    local procedure OnGetUseCaseConfig(CaseID: Guid; var ConfigText: Text; var IsHandled: Boolean)
    begin
        if IsHandled then
            exit;

        ConfigText := GetConfig(CaseID, IsHandled);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Tax Engine Assisted Setup", 'OnGetTaxTypeConfig', '', false, false)]
    local procedure OnGetTaxTypeConfig(TaxType: Code[20]; var ConfigText: Text; var IsHandled: Boolean)
    var
        GSTTDSTCSTaxTypeData: Codeunit "GST TDS TCS Tax Type Data";
        GSTTDSTCSTaxTypeLbl: Label 'GST TDS TCS';
    begin
        if IsHandled then
            exit;

        if TaxType = GSTTDSTCSTaxTypeLbl then begin
            ConfigText := GSTTDSTCSTaxTypeData.GetText();
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"GST Upgrade Subscribers", 'OnGetUpgradedTaxTypeConfig', '', false, false)]
    local procedure OnGetUpgradedTaxTypeConfig(TaxType: Code[20]; var ConfigText: Text; var IsHandled: Boolean)
    var
        GSTTDSTCSTaxTypeData: Codeunit "GST TDS TCS Tax Type Data";
        GSTTDSTCSTaxTypeLbl: Label 'GST TDS TCS';
    begin
        if IsHandled then
            exit;

        if TaxType = GSTTDSTCSTaxTypeLbl then begin
            ConfigText := GSTTDSTCSTaxTypeData.GetText();
            IsHandled := true;
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"GST Upgrade Subscribers", 'OnGetUpgradedUseCaseConfig', '', false, false)]
    local procedure OnGetGSTConfig(CaseID: Guid; var IsHandled: Boolean; var Configtext: Text)
    begin
        Configtext := GetConfig(CaseID, IsHandled);
    end;

    procedure GetConfig(CaseID: Guid; var Handled: Boolean): Text
    var
        "{94D595D0-1FF1-4501-AC76-164AD453F547}Lbl": Label 'GST Use Cases';
        "{8DDE731C-68ED-4658-BF7F-58385526601A}Lbl": Label 'GST Use Cases';
        "{2EC51C0B-DBA5-490B-AA60-944452C6BD3E}Lbl": Label 'GST Use Cases';
        "{C5A33AA3-0DA8-42DC-B6B2-B55888508F58}Lbl": Label 'GST Use Cases';
        "{81E6747B-B7CE-4A75-BEE5-F630FF17C687}Lbl": Label 'GST Use Cases';
        "{c34d7e4b-1538-4d41-9e72-71dfcf6fc94d}Lbl": Label 'GST Use Cases';
        "{5430a349-b6ae-4ca1-a7d9-6884d93da5ef}Lbl": Label 'GST Use Cases';
        "{7C83D9D2-7B73-48C6-AB6F-3E2E7221B1D8}Lbl": Label 'GST Use Cases';
        "{88BBCE88-A277-47A7-AC40-ED384C9224E8}Lbl": Label 'GST Use Cases';
    begin
        Handled := true;

        case CaseID of
            '{94D595D0-1FF1-4501-AC76-164AD453F547}':
                exit("{94D595D0-1FF1-4501-AC76-164AD453F547}Lbl");
            '{8DDE731C-68ED-4658-BF7F-58385526601A}':
                exit("{8DDE731C-68ED-4658-BF7F-58385526601A}Lbl");
            '{2EC51C0B-DBA5-490B-AA60-944452C6BD3E}':
                exit("{2EC51C0B-DBA5-490B-AA60-944452C6BD3E}Lbl");
            '{C5A33AA3-0DA8-42DC-B6B2-B55888508F58}':
                exit("{C5A33AA3-0DA8-42DC-B6B2-B55888508F58}Lbl");
            '{81E6747B-B7CE-4A75-BEE5-F630FF17C687}':
                exit("{81E6747B-B7CE-4A75-BEE5-F630FF17C687}Lbl");
            '{c34d7e4b-1538-4d41-9e72-71dfcf6fc94d}':
                exit("{c34d7e4b-1538-4d41-9e72-71dfcf6fc94d}Lbl");
            '{5430a349-b6ae-4ca1-a7d9-6884d93da5ef}':
                exit("{5430a349-b6ae-4ca1-a7d9-6884d93da5ef}Lbl");
            '{7C83D9D2-7B73-48C6-AB6F-3E2E7221B1D8}':
                exit("{7C83D9D2-7B73-48C6-AB6F-3E2E7221B1D8}Lbl");
            '{88BBCE88-A277-47A7-AC40-ED384C9224E8}':
                exit("{88BBCE88-A277-47A7-AC40-ED384C9224E8}Lbl");
        end;

        Handled := false;
    end;
}
