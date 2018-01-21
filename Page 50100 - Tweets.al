page 50100 Tweets
{
    PageType = List;
    SourceTable = Tweet;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("tweeted by";"tweeted by")
                {
                }

                field("Date Created";"Date Created")
                {
                }
                field("Tweet Text";"Tweet Text")
                {
                }
                field("tweet language";"tweet language")
                {
                }
                field(Sentiment;Sentiment)
                {
                    
                }
            }
        }
        area(FactBoxes)
        {
            part(EmojiPicture;"Emoji Picture")
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Delete Positive Tweets")
            {
                Image = "Delete";
                trigger OnAction();
                begin
                   DeleteAllPositiveTweets;
                   CurrPage.Update
                end;
            }

            action("Delete Neutral Tweets")
            {
                Image = "Delete";
                trigger OnAction();
                begin
                   DeleteAllNeutralTweets;
                   CurrPage.Update
                end;
            }

            action("Delete Negative Tweets")
            {
                Image = "Delete";
                trigger OnAction();
                begin
                   DeleteAllBadTweets;
                   CurrPage.Update
                end;
            }
        }
    }
    
    trigger OnOpenPage();
    begin
        ChooseEmojiPictureToShow();
    end;

    trigger OnAfterGetRecord();
    begin
        ChooseEmojiPictureToShow();
    end;

    local procedure ChooseEmojiPictureToShow ()
    var
       AverageSentimental : Decimal;
       EmojiPicture : page "Emoji Picture";

    begin
        CalculateAverageSentimental(AverageSentimental);
        If AverageSentimental >= 0.5 then
          EmojiPicture.SaveEmojiPicture(1);
        
        If (AverageSentimental >= 0.2) and (AverageSentimental < 0.5) then
          EmojiPicture.SaveEmojiPicture(0);

        If (AverageSentimental > 0) and (AverageSentimental < 0.2) then
          EmojiPicture.SaveEmojiPicture(-1);
    end;

    local procedure CalculateAverageSentimental(var AverageSentimental :Decimal)
    var 
      SaveSentiment :Decimal;
    begin
        if Count = 0 then
          exit;
        
        SaveSentiment := Sentiment;
        CalcSums(Sentiment);
        AverageSentimental := Sentiment/Count;
        Sentiment := SaveSentiment;
    end;

    local procedure DeleteAllPositiveTweets ();
    begin
        SetRange(Sentiment,0.5,1);
        DeleteAll;
        Reset;
    end;

    local procedure DeleteAllNeutralTweets ();
    begin
        SetRange(Sentiment,0.2,0.5);
        DeleteAll;
        Reset;

    end;

    local procedure DeleteAllBadTweets ();
    begin
        SetRange(Sentiment,0,0.2);
        DeleteAll;
        Reset;

    end;


    
}

