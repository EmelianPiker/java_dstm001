list="jni.mem.txt runtime/rt.jar.js jni.wasm cheerpOS.js jni.js jnilegacy.js cheerpj.js 64bit.js loader.js runtime/rt.jar.jdk.js cheerpj.css c.html runtime/rt.jar.java.util.function.js rt.jar runtime/rt.jar.sun.reflect.js runtime/rt.jar.java.lang.js runtime/rt.jar.java.nio.file.js runtime/rt.jar.java.util.concurrent.js runtime/rt.jar.sun.net.js runtime/rt.jar.sun.nio.js runtime/rt.jar.com.js"

for i in `seq 0 99`
do
  list="$list rt.jar.c${i}.txt"
done

for i in $list
do
  if [ ! -f cjrtnc.leaningtech.com/2.1/$i ]; then
    wget -m https://cjrtnc.leaningtech.com/2.1/$i
  fi
done
