
namespace GetUse.Academy.Bookstore;

using GetUse.Academy.Bookstore.Interface;
using GetUse.Academy.Bookstore.Tools;

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
                field("No."; Rec."No.") { }
                field(Description; Rec.Description) { }
                field(ISBN; Rec.ISBN) { }
                field(Author; Rec.Author) { }
                field(Type; Rec."Type") { }
                field("No. of Pages"; Rec."No. of Pages") { Visible = false; }
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
                begin
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

}