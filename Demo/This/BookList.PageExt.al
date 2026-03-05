pageextension 50102 "Book List" extends "Book List"
{
    actions
    {
        addlast(Processing)
        {
            group(Demo)
            {
                Caption = 'Demo';

                action(ThisDemo)
                {
                    Caption = 'This Demo';
                    ApplicationArea = All;
                    Image = Process;
                    ToolTip = 'Executes the This Demo action.';
                    RunObject = codeunit "This-Demo";
                }
            }
        }
    }

}