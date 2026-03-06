namespace GetUse.Academy.Bookstore.Interface;

codeunit 50110 "Book Type Default Impl." implements "Book Type Process"
{
    procedure StartDeployBook()
    begin
        Message('Buch ist Type None, kann nichr behandelt werden');
    end;

    procedure StartDeliverBook()
    begin
        Message('Buch ist Type None, kann nichr behandelt werden');
    end;
}