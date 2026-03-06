namespace GetUse.Academy.Bookstore.InterfaceList;
using Microsoft.Sales.Customer;
using GetUse.Academy.Bookstore.Interface;

pageextension 50104 "Customer List Interface" extends "Customer List"
{
    actions
    {
        addlast(processing)
        {
            action(CustomerCheckPipeline)
            {
                Caption = 'Customer Check Pipeline';
                ApplicationArea = All;
                Image = Process;
                ToolTip = 'Executes the Customer Check Pipeline action.';

                trigger OnAction()
                var
                    CheckPipeline: Codeunit "Check Pipeline";
                begin
                    CheckPipeline.ProcessPipeline(Rec);
                end;

            }
            // action(TestSort)
            // {
            //     Caption = 'TestSort';
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     var
            //         Dict: Dictionary of [Integer, Text];
            //     begin
            //         Dict.Add(100, 'XXXX');
            //         Dict.Add(50, 'ABC');
            //         Dict.sort

            //     end;
        }
    }
}

