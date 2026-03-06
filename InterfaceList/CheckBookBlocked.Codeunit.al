namespace GetUse.Academy.Bookstore.InterfaceList;
using GetUse.Academy.Bookstore;

codeunit 50107 "Check Book Blocked" implements "Check Step"
{
    procedure Execute(RecRef: RecordRef): Text
    var
        Book: Record Book;
    begin
        RecRef.SetTable(Book);
        if Book.Blocked then
            exit('100: Book ist blocked');
    end;

    procedure GetSequence(): Integer
    begin
        exit(100);
    end;

    procedure IsEnabled(RecRef: RecordRef): Boolean
    begin
        exit(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Check Pipeline", OnRegisterCheckSteps, '', false, false)]
    local procedure "Check Pipeline_OnRegisterCheckSteps"(var Steps: List of [Interface "Check Step"]; RecRef: RecordRef)
    begin
        if RecRef.Number = Database::Book then
            Steps.Add(this);
    end;

}