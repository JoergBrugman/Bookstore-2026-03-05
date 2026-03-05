namespace GetUse.Academy.Bookstore.Demo.Resources;
using GetUse.Academy.Bookstore;
using Microsoft.Sales.Customer;

pageextension 50103 "Book List Resources Demo" extends "Book List"
{
    actions
    {
        addlast(Demo)
        {
            action(ResourcesListDemo)
            {
                Caption = 'List the Resources';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the List the Resources action.';

                trigger OnAction()
                var
                    ResourceList: List of [Text];
                    Txt: Text;
                    TxtBuilder: TextBuilder;
                begin
                    ResourceList := NavApp.ListResources();
                    foreach Txt in ResourceList do
                        TxtBuilder.AppendLine(Txt);
                    Message(TxtBuilder.ToText());
                end;
            }
            action(ResourceCSVDemo)
            {
                Caption = 'Reads the CSV-File';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Reads the CSV-File action.';
                trigger OnAction()
                var
                    ResStr: InStream;
                    ValueTxt: Text;
                begin
                    NavApp.GetResource('ProgrammingLanguages.csv', ResStr);
                    while not ResStr.EOS do begin
                        ResStr.ReadText(ValueTxt);
                        Message(ValueTxt);
                    end;
                end;
            }
            action("ResourcePNGDemo")
            {
                Caption = 'Resource PNG Demo';
                ApplicationArea = ALl;
                Image = Process;
                ToolTip = 'Executes the Resource PNG Demo action.';

                trigger OnAction()
                var
                    Customer: Record Customer;
                    ResStr: InStream;
                begin
                    NavApp.GetResource('Dynamics_365_Business_Central_logo.png', ResStr);

                    Customer.Init();
                    Customer."No." := '';
                    customer.Insert(true);
                    Customer.Image.ImportStream(ResStr, 'Demo Picture');
                    Customer.Modify();
                    Page.Run(Page::"Customer Card", Customer);
                end;
            }

        }
    }
}