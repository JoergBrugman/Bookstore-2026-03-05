namespace GetUse.Academy.Bookstore.Demo.This;

codeunit 50101 "This-Demo"
{
    trigger OnRun()
    begin
        SetStateVar('Levele 1');
        Message('In ursprünglicher CU: %1', StateVar);
        CallThisProcedure(this);
        Message('In ursprünglicher CU: %1', StateVar);
        ThisDemoClient.ThisClientProcedure(this);
        Message('In ursprünglicher CU: %1', StateVar);
    end;

    procedure GetStateVar(): Text
    begin
        exit(StateVar);
    end;

    procedure SetStateVar(StateVar: Text)
    begin
        this.StateVar := StateVar;
    end;

    local procedure CallThisProcedure(ThisDemo: Codeunit "This-Demo")
    begin
        Message('In Referenz-CU: %1', ThisDemo.GetStateVar());
        ThisDemo.SetStateVar('Level 2');
        Message('In Referenz-CU: %1', ThisDemo.GetStateVar());
    end;

    var
        ThisDemoClient: Codeunit "This-Demo Client";
        StateVar: text;

}