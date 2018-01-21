page 50101 "Emoji Picture"
{
  PageType = CardPart;
  SourceTable = "Emoji Picture";
    
  layout
  {
    area(Content)
    {
      field(Picture;Picture)
      {
      }
    }
  }
  actions
  {
    area(Processing)
    {
      action("Import File")
      {
        Image = "Import";
        Visible = false;
        
        trigger OnAction()
        var
           EmojiPictureMgt : Codeunit "Emoji Picture";
        begin
           EmojiPictureMgt.ImportImageAndConvertTo64Base();
        end;
        
      }
    }
  }
  var

  procedure SaveEmojiPicture (EmojiType: Integer)
  var
    EmojiPictureMgt : Codeunit "Emoji Picture";
    InStr: InStream;
    TempBlob: Record TempBlob;

  begin
    DELETEALL;
    
    CASE EmojiType of
      1: EmojiPictureMgt.GetGoodSmileAndConvertFrom64Base(TempBlob);
      0: EmojiPictureMgt.GetNeutralSmileAndConvertFrom64Base(TempBlob);
     -1: EmojiPictureMgt.GetBadSmileAndConvertFrom64Base(TempBlob);
     end;
    
    TempBlob.Blob.CREATEINSTREAM(InStr);
    Picture.IMPORTSTREAM(InStr,'Picture');
    IF NOT MODIFY(TRUE) THEN
       INSERT(TRUE);
  end;
}