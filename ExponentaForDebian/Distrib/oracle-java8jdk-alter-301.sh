folder=jdk1.8.0_301
prio=301

update-alternatives --install /usr/bin/java java /usr/lib/jvm/$folder/bin/java $prio
update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/$folder/bin/javaws $prio
update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/$folder/bin/javac $prio
update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/$folder/bin/jar $prio
update-alternatives --install /usr/bin/jsadebugd jsadebugd /usr/lib/jvm/$folder/bin/jsadebugd $prio
update-alternatives --install /usr/bin/native2ascii native2ascii /usr/lib/jvm/$folder/bin/native2ascii $prio
update-alternatives --install /usr/bin/javah javah /usr/lib/jvm/$folder/bin/javah $prio
update-alternatives --install /usr/bin/hsdb hsdb /usr/lib/jvm/$folder/bin/hsdb $prio
update-alternatives --install /usr/bin/clhsdb clhsdb /usr/lib/jvm/$folder/bin/clhsdb $prio
update-alternatives --install /usr/bin/xjc xjc /usr/lib/jvm/$folder/bin/xjc $prio
update-alternatives --install /usr/bin/schemagen schemagen /usr/lib/jvm/$folder/bin/schemagen $prio
update-alternatives --install /usr/bin/extcheck extcheck /usr/lib/jvm/$folder/bin/extcheck $prio
update-alternatives --install /usr/bin/jhat jhat /usr/lib/jvm/$folder/bin/jhat $prio
update-alternatives --install /usr/bin/wsgen wsgen /usr/lib/jvm/$folder/bin/wsgen $prio
update-alternatives --install /usr/bin/policytool policytool /usr/lib/jvm/$folder/bin/policytool $prio
update-alternatives --install /usr/bin/appletviewer appletviewer /usr/lib/jvm/$folder/bin/appletviewer $prio
# update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /usr/lib/jvm/$folder/jre/lib/amd64/libnpjp2.so $prio
update-alternatives --set java /usr/lib/jvm/$folder/bin/java
update-alternatives --set javaws /usr/lib/jvm/$folder/bin/javaws
update-alternatives --set javac /usr/lib/jvm/$folder/bin/javac
update-alternatives --set jar /usr/lib/jvm/$folder/bin/jar
update-alternatives --set jsadebugd /usr/lib/jvm/$folder/bin/jsadebugd
update-alternatives --set native2ascii /usr/lib/jvm/$folder/bin/native2ascii
update-alternatives --set javah /usr/lib/jvm/$folder/bin/javah
update-alternatives --set hsdb /usr/lib/jvm/$folder/bin/hsdb
update-alternatives --set clhsdb /usr/lib/jvm/$folder/bin/clhsdb
update-alternatives --set xjc /usr/lib/jvm/$folder/bin/xjc
update-alternatives --set schemagen /usr/lib/jvm/$folder/bin/schemagen
update-alternatives --set extcheck /usr/lib/jvm/$folder/bin/extcheck
update-alternatives --set jhat /usr/lib/jvm/$folder/bin/jhat
update-alternatives --set wsgen /usr/lib/jvm/$folder/bin/wsgen
update-alternatives --set policytool /usr/lib/jvm/$folder/bin/policytool
update-alternatives --set appletviewer /usr/lib/jvm/$folder/bin/appletviewer
# update-alternatives --set mozilla-javaplugin.so /usr/lib/jvm/$folder/jre/lib/amd64/libnpjp2.so

