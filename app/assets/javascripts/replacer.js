/*
    ページに埋め込んでもらうスクリプト
 */
(function () {
  if (window['isActiveListingReplacer']) return
  window['isActiveListingReplacer'] = true
  function envalue (terms, params) {
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
  function paramParse (search) {
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
  function script (conf) {
    if (window.location.origin !== conf.host || window.location.pathname !== conf.path) {
      errorReport('URLが異なります')
      return
    }
    const params = paramParse(window.location.search)
    conf.replaces.forEach(r => {
      if (!envalue(r.terms, params)) return
      const html = document.querySelector('html')
      let tmp = html
      try {
        for (let i = 0; i < r.location.length; i++) tmp = tmp.children[r.location[i]]
      } catch (e) {
        errorReport('親のDOM構造が変化しています')
        return
      }
      if (hash(tmp.innerHTML) !== r.hash) {
        errorReport('ターゲットの内部が変化しています')
        return
      }
      tmp.outerHTML = r.rep
    })
  }
  function XMLHttpRequestCreate(){
    try{
      return new XMLHttpRequest();
    }catch(e){}
    try{
      return new ActiveXObject('MSXML2.XMLHTTP.6.0');
    }catch(e){}
    try{
      return new ActiveXObject('MSXML2.XMLHTTP.3.0');
    }catch(e){}
    try{
      return new ActiveXObject('MSXML2.XMLHTTP');
    }catch(e){}
    return null;
  }
  function get (c) {
    const url = 'server_url/[UUID]'
    if (!data) {
      alert('要素が選択されてません')
      return
    }
    const xhr = XMLHttpRequestCreate()
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4 && xhr.status >= 200 && xhr.status < 300) {
        c(JSON.parse(xhr.responseText))
      }
    }
    xhr.open('GET', url)
    xhr.send()
  }
  function errorReport (err) {
    const url = 'server_url/[UUID]'
    const xhr = XMLHttpRequestCreate()
    xhr.open('POST', url)
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({message: err}))
  }
  get(script)
})()
