(function() {
  if (window['isActiveListingReplacer']) return
  window['isActiveListingReplacer'] = true

  function envalue(terms, params) {
    let ret
    if (terms['op']) {
      if (terms['op'] === 'and') {
        ret = true
        terms.terms.forEach(term => {
          if (!envalue(term, params)) ret = false
        })
      } else if (terms['op'] === 'or') {
        ret = true
        terms.terms.forEach(term => {
          if (envalue(term, params)) ret = true
        })
      } else if (terms['op'] === 'not') {
        return !envalue(terms.terms[0], params)
      }
      return ret
    } else {
      return params[terms['param']]
    }
  }

  function paramParse(search) {
    const params = search.substr(1, search.length).split('&')
    const ret = {}
    params.forEach(p => {
      const ops = p.split('=')
      if (ops.length === 1) {
        ret[ops[0]] = true
      } else {
        const key = ops.shift()
        ret[key] = ops.join('=')
      }
    })
    return ret
  }

  function script(conf) {
    const l = conf.kahen_selector.replace(/\\/g, '');
    const k = JSON.parse(l)
    console.log(k.host)
    if (window.location.origin !== k.host || window.location.pathname !== k.path) {
      errorReport('URLが異なります')
      return
    }
    const params = paramParse(window.location.search)
    k.ad_parameter.forEach(r => {
      if (!envalue(r.ad_parameter, params)) return
      const html = document.querySelector('html')
      let tmp = html
      try {
        for (let i = 0; i < r.location.length; i++) tmp = tmp.children[r.location[i]]
      } catch (e) {
        errorReport('親のDOM構造が変化しています')
        return
      }
      if (hash(tmp.innerHTML) !== r.hash_i) {
        errorReport('ターゲットの内部が変化しています')
        return
      }
      tmp.outerHTML = r.rep
    })
  }

  function XMLHttpRequestCreate() {
    try {
      return new XMLHttpRequest();
    } catch (e) {}
    try {
      return new ActiveXObject('MSXML2.XMLHTTP.6.0');
    } catch (e) {}
    try {
      return new ActiveXObject('MSXML2.XMLHTTP.3.0');
    } catch (e) {}
    try {
      return new ActiveXObject('MSXML2.XMLHTTP');
    } catch (e) {}
    return null;
  }

  function get(c) {
    const url = 'http://localhost:3000/listings/59.json'
    const xhr = XMLHttpRequestCreate()
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4 && xhr.status >= 200 && xhr.status < 300) {
        console.log(xhr.responseText)
        c(JSON.parse(xhr.responseText))
        // c(JSON.parse(xhr.responseText.kahen_selector))
      }
    }
    xhr.open('GET', url)
    xhr.send()
  }

  function errorReport(err) {
    const url = ''
    const xhr = XMLHttpRequestCreate()
    xhr.open('POST', url)
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
      message: err
    }))
  }
  get(script)
})()
