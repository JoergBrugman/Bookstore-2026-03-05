
namespace GetUse.Academy.Bookstore;

using GetUse.Academy.Bookstore.Interface;
using GetUse.Academy.Bookstore.Tools;
using GetUse.Academy.Bookstore.InterfaceList;

page 50101 "Book List"
{
    Caption = 'Books';
    PageType = List;
    SourceTable = Book;
    Editable = false;
    CardPageId = "Book Card";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Books)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = 'de-DE=Nr.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field(Author; Rec.Author)
                {
                    ToolTip = 'Specifies the value of the Author field.';
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No. of Pages"; Rec."No. of Pages")
                {
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Pages field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links) { ApplicationArea = RecordLinks; }
            systempart(Notes; Notes) { ApplicationArea = Notes; }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateBooks)
            {
                Caption = 'Create Books';
                Image = CreateDocuments;
                ApplicationArea = All;
                ToolTip = 'Executes the Create Books action.';
                RunObject = codeunit "Create Books";
            }
            action(BookSale)
            {
                Caption = 'Start Sales Process';
                Image = Process;
                ApplicationArea = All;
                ToolTip = 'Executes the Start Sales Process action.';

                trigger OnAction()
                var
                    BookTypeDefaultImpl: Codeunit "Book Type Default Impl.";
                begin
                    if Rec.Type = "Book Type"::" " then
                        exit;
                    BookTypeDefaultImpl.StartDeployBook();
                    BookTypeDefaultImpl.StartDeliverBook();
                end;
            }
            action(BookSaleWithInterface)
            {
                Caption = 'BookSale with Interface';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the BookSale with Interface action.';

                trigger OnAction()
                var
                    BookTypeProcess: Interface "Book Type Process";
                    IsHandled: Boolean;
                    BookTypeDefaultImpl: Codeunit "Book Type Default Impl.";
                    BookTypeHardcoverImpl: Codeunit "Book Type Hardcover Impl.";
                    BookTypePaperbackImpl: Codeunit "Book Type Paperback Impl.";
                begin
                    OnBeforeHandleBookTypeProcess(Rec, BookTypeProcess, IsHandled);
                    if IsHandled then
                        exit;

                    case Rec.Type of
                        "Book Type"::" ":
                            BookTypeProcess := BookTypeDefaultImpl;
                        "Book Type"::Hardcover:
                            BookTypeProcess := BookTypeHardcoverImpl;
                        "Book Type"::Paperback:
                            BookTypeProcess := BookTypePaperbackImpl;
                    end;
                    BookTypeProcess.StartDeployBook();
                    BookTypeProcess.StartDeliverBook();
                end;
            }
            action(SalesProcessWithEnumAndInterface)
            {
                Caption = 'SalesProcessWithEnumAndInterface';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the SalesProcessWithEnumAndInterface action.';

                trigger OnAction()
                var
                    BookTypeProcess: Interface "Book Type Process";
                begin
                    BookTypeProcess := Rec.Type;
                    BookTypeProcess.StartDeployBook();
                    if BookTypeProcess is "Book Type Process V2" then
                        (BookTypeProcess as "Book Type Process V2").CheckQuality();
                    BookTypeProcess.StartDeliverBook();
                end;
            }
            action(BookCheckPipeline)
            {
                Caption = 'Book Check Pipeline';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Book Check Pipeline action.';

                trigger OnAction()
                var
                    CheckPipeline: Codeunit "Check Pipeline";
                begin
                    CheckPipeline.ProcessPipeline(Rec);
                end;

            }

        }
        area(Reporting)
        {
            action(BookList)
            {
                Caption = 'Book List';
                Image = PrintReport;
                RunObject = report "Book - List";
                ToolTip = 'Executes the Book List report.';
            }
        }
    }


    [IntegrationEvent(false, false)]
    local procedure OnBeforeHandleBookTypeProcess(var Rec: Record Book; BookTypeProcess: Interface "Book Type Process"; var IsHandled: Boolean)
    begin
    end;
}