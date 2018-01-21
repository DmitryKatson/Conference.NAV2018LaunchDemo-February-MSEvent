table 50100 Tweet
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Date Created";Date)
        {
        }
        field(3;"Time Created";Time)
        {
        }
        field(4;"Tweet Text";Text[250])
        {
        }
        field(5;"Created At";Text[50])
        {
        }
        field(6;Description;Text[250])
        {
        }
        field(7;Favorited;Text[125])
        {
        }
        field(8;"Favourites count";Integer)
        {
        }
        field(9;"Followers count";Integer)
        {
        }
        field(10;"Friends count";Integer)
        {
        }
        field(11;in_reply_to_user_id;Text[125])
        {
        }
        field(12;Location;Text[125])
        {
        }
        field(13;"MediaUrls - Item";Text[125])
        {
        }
        field(14;"Mentioned user full name";Text[125])
        {
        }
        field(15;"Mentioned user id";Text[125])
        {
        }
        field(16;"Mentioned user name";Text[125])
        {
        }
        field(17;Name;Text[125])
        {
        }
        field(18;"Original tweet created at";Text[125])
        {
        }
        field(19;"Original tweet favorited";Text[125])
        {
        }
        field(20;"Original tweet id";BigInteger)
        {
        }
        field(21;"Orig Tweet in_reply_to_user_id";Text[125])
        {
        }
        field(22;"Original tweet language";Text[125])
        {
        }
        field(23;"Orig Tw Mentioned user fn";Text[125])
        {
        }
        field(24;"Orig Tw mentioned user id";Text[125])
        {
        }
        field(25;"Orig tw mentioned user name";Text[125])
        {
        }
        field(26;"orig tw retweet count";Integer)
        {
        }
        field(27;"Original tweet text";Text[125])
        {
        }
        field(28;"Original tweet tweeted by";Text[125])
        {
        }
        field(29;"Orig Tw user desc";Text[125])
        {
        }
        field(30;"orig tw user fav cnt";Integer)
        {
        }
        field(31;"orig tw user foll cnt";Integer)
        {
        }
        field(32;"orig tw user friends cnt";Integer)
        {
        }
        field(33;"orig tw user full name";Text[15])
        {
        }
        field(34;"orig tweet user id";Text[15])
        {
        }
        field(35;"orig tweet user location";Text[15])
        {
        }
        field(36;"orig tw user name";Text[15])
        {
        }
        field(37;"orig tw user profile image url";Text[15])
        {
        }
        field(38;"orig tw user statuses cnt";Integer)
        {
        }
        field(39;"orig tw media url item";Text[125])
        {
        }
        field(40;"profile image url";Text[125])
        {
        }
        field(41;"retweet count";Integer)
        {
        }
        field(42;"statuses count";Integer)
        {
        }
        field(43;"tweet id";BigInteger)
        {
        }
        field(44;"tweet language";Text[20])
        {
        }
        field(46;"tweeted by";Text[20])
        {
        }
        field(47;"user id";Text[20])
        {
        }
        field(48;"user name";Text[20])
        {
        }
        field(49;TweetID_Text;Text[100])
        {
        }
        field(50;TweetText_Text;Text[250])
        {

            trigger OnLookup();
            begin
                "Tweet Text" := COPYSTR(TweetText_Text,1,MAXSTRLEN("Tweet Text"));
            end;
        }
        field(51;Sentiment;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
    }

    fieldgroups
    {
    }

}

