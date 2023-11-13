program HeapSort;

CONST
        MaxSize = 100;

TYPE
        DataType = Integer;
        ListType = Array[1..MaxSize] OF DataType;

VAR
        I : Integer;
        List : ListType;

(***************************************)

PROCEDURE Exchange(VAR First, Second : DataType);

VAR
        Aux : DataType;

BEGIN
        Aux := First;
        First := Second;
        Second := Aux

END; (*Exchange*)

(***************************************)

PROCEDURE DownHeap (VAR HeapItems : ListType;
                        Root, LastPosition : Integer);


VAR
        HeapOK : Boolean; // Distribution of the heap is finished
        MaxChild : Integer; // Index of the child with highest value

BEGIN
        HeapOK := False;

        WHILE (Root * 2 <= LastPosition) AND NOT HeapOK DO
          BEGIN
            IF Root * 2 = LastPosition THEN
                MaxChild := Root * 2
            ELSE
                 IF HeapItems[Root * 2] > HeapItems[Root * 2 + 1] THEN
                    MaxChild := Root * 2
                 ELSE
                   MaxChild := Root * 2 + 1;
        IF HeapItems[Root] < HeapItems[MaxChild] THEN
          BEGIN
                Exchange(HeapItems[Root], HeapItems[MaxChild]);
                Root := MaxChild
          END
        ELSE
                HeapOK := True
        END (*While*)

END; (*DownHeap*)

(***************************************)

PROCEDURE HeapSort (VAR Data : ListType; ElementsNumber : Integer);

VAR
        NodeIndex : Integer;

BEGIN
        FOR NodeIndex := (ElementsNumber DIV 2) DOWNTO 1 DO
          DownHeap(Data, NodeIndex, ElementsNumber);

        FOR NodeIndex := ElementsNumber DOWNTO 2 DO
          BEGIN
                Exchange(Data[1], Data[NodeIndex]);
                DownHeap(Data, 1, NodeIndex - 1)
          END

END; (*HeapSort*)

(***************************************)

BEGIN // Test algorithm with thirty-six random numbers

RANDOMIZE; // To generate different random numbers in each run

        FOR I := 1 TO 36 DO
          List[I] := RANDOM(200) + 1; // Between 1-199
          HeapSort(List, 36);


        FOR I := 1 TO 36 DO
         Write(List[I], ' | ')

END.