namespace GetUse.Academy.Bookstore.Interface;

codeunit 50110 "Book Type Default Impl."
{
    procedure StartDeployBook()
    begin
        Message('Aus Lager entnehmen');
    end;

    procedure StartDeliverBook()
    begin
        Message('Mit DPD versenden');
    end;
}