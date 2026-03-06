namespace GetUse.Academy.Bookstore.ExternalFxileStorage;

using System.ExternalFileStorage;
using System.IO;

page 50108 "External File Storage"
{
    Caption = 'WN26 External File Storage';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;

    actions
    {
        area(Processing)
        {
            action(ExportToFileStorage)
            {
                Caption = 'Export to Storage';
                Image = Export;
                ToolTip = 'Executes the Export to Storage action.';

                trigger OnAction()
                var
                    ExternalFileStorage: Codeunit "External File Storage";
                    FileManagement: Codeunit "File Management";
                    InStr: InStream;
                    FileName, NameOnly, Extension : Text;
                    FilePath: Text;
                begin
                    if not UploadIntoStream('Select File', '', 'All Files (*.*)|*.*', FileName, InStr) then
                        exit;

                    NameOnly := FileManagement.GetFileNameWithoutExtension(FileName);
                    Extension := FileManagement.GetExtension(FileName);
                    ExternalFileStorage.Initialize(Enum::"File Scenario"::WhatsNewBC26);
                    FilePath := ExternalFileStorage.SaveFile('', NameOnly, Extension, 'Save as');
                    ExternalFileStorage.CreateFile(FilePath, InStr)
                end;
            }
        }
        area(Navigation)
        {
            action(FileAccounts)
            {
                Caption = 'File Accounts', Comment = 'de-DE=Externe Dateispeicher';
                Image = Account;
                ToolTip = 'Executes the File Accounts action.';
                RunObject = page "File Accounts";
            }
        }
        area(Promoted)
        {
            actionref(ExportToFileStorage_Promoted; ExportToFileStorage) { }
            actionref(FileAccounts_Pronmoted; FileAccounts) { }
        }
    }
}