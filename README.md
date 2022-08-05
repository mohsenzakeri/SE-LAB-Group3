# اسم فامیل
## Sotware Enginerring Lab Project - group 3

1- بعد از bundle install برای این‌که برنامه رو اجرا کنید، دو تا ترمینال باز کنید. توی یکی سرور ریلز رو بالا بیارید و توی یکی سرویس faye رو.
برای بالا آوردن سرور rails، پورتش رو باید عوض کنید. با پورت ۳۰۰۰ نمی‌شه انگار. با faye تداخل داره ظاهرا! در نتیجه بزنید:
rails s -p [port#]  example: rails s -p 3001
توی اون یکی ترمینال بزنید: 
bundle exec rackup private_pub.ru -s thin -E production
و دقت کنید که اجرا بشه و exit نکنه.

۲- من همینجوری الکی روی صفحه‌ی index.html.erb داخل پوشه‌ی games گفتم نوشته بشه وقتی چیز جدیدی می‌آد. می‌تونین تغییرش بدین به هرکجا. مثلا توی navbar یه گزینه برای نوتیفیکیشن اضافه بشه و ...
چیزهایی که نوشتم به این صورته که در صفحه‌ی index یک tag جدید گذاشتم به اسم joined برای این‌که نوتیفیکیشن‌ها اونجا نوشته بشن. و زیرش نوشتم:
<%= subscribe_to "/user_games/new" %>

که "/user_games/new" در واقع کانالی هست که از طریقش به هم متصل می‌شن دو طرف و یعنی که وقتی یک user_game جدید ایجاد می‌شه نوتیفیکیشن بره.

۳- اگر برنامه رو اجرا کنید می‌بینید که یه پیغام alert هم داده یم‌شه به جز این‌که در تگ joined چیزی نوشته می‌شه. اون جهت تست هست. برای برداشتن یا تغییرش برید به صفحه‌ی app/assets/javascripts/user_games/user_games.js.coffee و این دستور رو کامنت کنید یا تغییر بدید:

```PrivatePub.subscribe "/user_games/new", (data, channel) -> alert data.user_game.id```

۴- در صفحه‌ی کنترلر user_game در تابع create یه خط اضافه کردم: PrivatePub.publish_to("/user_games/new", user_game: @user_game)

۵- یه ویوی partial هم تو user_games ایجاد کردم به اسم _user_game

۶- تو فایل create.js که قبلا اطلاعات مربوط به ajax رو نوشته بودیم، این‌ها رو اضافه کردم:

```
<% publish_to "/user_games/new" do %>
	$("#joined").append("<%= j render(@user_game)%>");
<%end%>
```

$("#new_user_game")[0].reset();

۷- در فایل app/assets/javascripts/aplication.js هم این خط رو اضافه کردم:
```
//= require private_pub
```
۸- دیگه همین :) فکر کنم همین کارارو کرده باشم فقط.
موفق باشید :)

References:
```
https://github.com/ryanb/private_pub
http://railscasts.com/episodes/316-private-pub
```
