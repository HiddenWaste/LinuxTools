
 
echo "Lets get our YouTube to MP3 Player!"

snap install yt-dlp

echo "Installation successfull? Make one more check"

hash -r

echo "Testing Strawberry Switchblade...."

yt-dlp -x --audio-format mp3 https://youtu.be/x7QPBzAJ_io?si=o0t2W-ef8E-gF-dM

echo "All finished! Happy Sampling!!"

# vlc ./'Strawberry Switchblade
