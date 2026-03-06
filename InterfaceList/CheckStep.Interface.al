namespace GetUse.Academy.Bookstore.InterfaceList;

interface "Check Step"
{
    /// <summary>
    /// Performs the Check
    /// </summary>
    /// <param name="RecRef"></param>
    /// <returns>Text</returns>
    procedure Execute(RecRef: RecordRef): Text;
    /// <summary>
    /// Returns the priority of the check as an integer.
    /// Here, a low number has a high priority and lager numbers have a lower priority.
    /// </summary>
    /// <returns>Priority</returns>
    procedure GetSequence(): Integer;
    /// <summary>
    /// Determines whether the check should be performed.
    /// </summary>
    /// <param name="RecRef"></param>
    /// <returns>Boolean</returns>
    procedure IsEnabled(RecRef: RecordRef): Boolean;
}