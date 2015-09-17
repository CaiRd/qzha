var maxstrlen = 140;

function Q(s) { return document.getElementById(s); }

function checkWord(c) {

    len = maxstrlen;

    var str = c.value;

    myLen = getStrleng(str);

    var wck = Q("wordCheck");

    if (myLen > len * 2) {

        c.value = str.substring(0, i + 1);

    }

    else {

        wck.innerHTML = Math.floor((len * 2 - myLen) / 2);

    }

}

function getStrleng(str) {

    myLen = 0;

    i = 0;

    for (; (i < str.length) && (myLen <= maxstrlen * 2) ; i++) {

        if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)

            myLen++;

        else

            myLen += 2;

    }

    return myLen;

}