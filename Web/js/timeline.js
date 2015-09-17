var d1, d2, day, h, m, s, ms, d1ms, d2ms, dms, hms, mms,
dms = 1000 * 60 * 60 * 24
hms = 1000 * 60 * 60
mms = 1000 * 60

function counter() {
    d1 = new Date(2016, 05, 08, 0, 0, 0)
    d2 = new Date()
    d1ms = d1.getTime()
    d2ms = d2.getTime()
    ms = d1ms - d2ms


    if (ms <= 0) {
        day = 00
        h = 00
        m = 00
        s = 00
        ss = 0 % 1000

    }
    else {
        day = Math.floor(ms / dms)
        h = Math.floor(ms % dms / hms)
        m = Math.floor(ms % hms / mms)
        s = Math.floor(ms % mms / 1000)
        var ss = Math.floor(ms % 1000)


        document.getElementById('day').innerHTML = day;
        document.getElementById('hours').innerHTML = h;
        document.getElementById('mins').innerHTML = m;
        document.getElementById('seconds').innerHTML = s;


    }
    if (day <= 9) {
        document.getElementById('day').innerHTML = "0" + day;
    }
    if (h <= 9) {
        document.getElementById('hours').innerHTML = "0" + h;
    }
    else {
        document.getElementById('hours').innerHTML = h;
    }
    if (m <= 9) {
        document.getElementById('mins').innerHTML = "0" + m;
    }
    else {
        document.getElementById('mins').innerHTML = m;
    }

    if (s <= 9) {
        document.getElementById('seconds').innerHTML = "0" + s;
        document.getElementById('minisec').innerHTML = ss;

    }
    else {

        document.getElementById('seconds').innerHTML = s;
        document.getElementById('minisec').innerHTML = ss;
    }
    document.getElementById('minisec').innerHTML = ss;

}

counter()
window.setInterval("counter()", 1)