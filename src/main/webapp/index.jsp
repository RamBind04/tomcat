<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1" />
  <title>SocialSite — Home (Mockup)</title>
  <style>
    /* Simple, single-file mockup styles (educational only). */
    :root{--bg:#f0f2f5;--card:#fff;--accent:#1877f2;--muted:#65676b}
    *{box-sizing:border-box;font-family:Inter,Segoe UI,Roboto,Arial,sans-serif}
    body{margin:0;background:var(--bg);color:#050505}
    header{background:linear-gradient(90deg,#fff, #fff);border-bottom:1px solid #e0e0e0;position:sticky;top:0;z-index:10}
    .container{max-width:1100px;margin:0 auto;padding:12px}
    .header-row{display:flex;align-items:center;gap:12px}
    .brand{font-weight:700;color:var(--accent);font-size:20px}
    .search{flex:1}
    .search input{width:100%;padding:8px 12px;border-radius:20px;border:1px solid #ddd;background:#f6f7f9}

    .layout{display:grid;grid-template-columns:260px 1fr 300px;gap:16px;padding:18px 12px}

    /* left sidebar */
    .card{background:var(--card);border-radius:8px;padding:12px;box-shadow:0 1px 2px rgba(0,0,0,0.04)}
    .sidebar .item{display:flex;align-items:center;gap:10px;padding:8px 4px;border-radius:6px}
    .sidebar .item img{width:36px;height:36px;border-radius:6px;object-fit:cover}
    .sidebar h3{margin:6px 0 10px;font-size:14px;color:#111}

    /* center feed */
    .compose{display:flex;gap:12px;align-items:center}
    .compose textarea{flex:1;min-height:60px;padding:10px;border-radius:8px;border:1px solid #e6e6e6;resize:vertical}
    .post{margin-top:12px}
    .post .meta{display:flex;gap:10px;align-items:center}
    .post .meta img{width:44px;height:44px;border-radius:50%;object-fit:cover}
    .post .content{margin-top:8px}
    .post .actions{display:flex;gap:8px;margin-top:10px;border-top:1px solid #eee;padding-top:10px}
    .btn{padding:8px 12px;border-radius:6px;border:0;cursor:pointer}
    .btn-like{background:transparent}

    /* right column */
    .trending li{padding:8px 0;border-bottom:1px solid #f0f0f0}

    /* responsive */
    @media (max-width:980px){.layout{grid-template-columns:1fr;}.container{padding:8px}.header-row{flex-wrap:wrap}}
  </style>
</head>
<body>
  <header>
    <div class="container">
      <div class="header-row">
        <div class="brand">SocialSite</div>
        <div class="search"><input placeholder="Search" aria-label="Search" /></div>
        <div class="profile card" style="padding:6px 10px;border-radius:20px">Hi, User</div>
      </div>
    </div>
  </header>

  <main class="container">
    <div class="layout">

      <!-- Left sidebar -->
      <aside class="sidebar">
        <div class="card">
          <h3>Your shortcuts</h3>
          <div class="item"><img src="https://via.placeholder.com/36" alt=""/><div>Groups</div></div>
          <div class="item"><img src="https://via.placeholder.com/36" alt=""/><div>Events</div></div>
          <div class="item"><img src="https://via.placeholder.com/36" alt=""/><div>Saved</div></div>
        </div>
      </aside>

      <!-- Feed -->
      <section>
        <div class="card">
          <div class="compose">
            <img src="https://via.placeholder.com/44" alt="avatar" style="border-radius:50%"/>
            <textarea id="composeText" placeholder="What's on your mind?"></textarea>
            <button class="btn" id="postBtn">Post</button>
          </div>
        </div>

        <div id="feed">
          <!-- sample post -->
          <div class="post card" data-id="1">
            <div class="meta">
              <img src="https://via.placeholder.com/44" alt="author">
              <div>
                <div style="font-weight:600">Jane Doe</div>
                <div style="font-size:12px;color:var(--muted)">2 hrs · Public</div>
              </div>
            </div>
            <div class="content">This is a sample post to demonstrate a layout for a social feed. Replace with real content.</div>
            <div class="actions">
              <button class="btn btn-like" onclick="likePost(this)">Like (<span class="likes">3</span>)</button>
              <button class="btn">Comment</button>
              <button class="btn">Share</button>
            </div>
          </div>
        </div>
      </section>

      <!-- Right column -->
      <aside>
        <div class="card">
          <h3>Trending</h3>
          <ul class="trending" style="list-style:none;padding:0;margin:0">
            <li>#WebDev</li>
            <li>#Design</li>
            <li>#OpenSource</li>
          </ul>
        </div>
      </aside>

    </div>
  </main>

  <script>
    // Minimal interactivity (educational mockup). Not connected to any backend.
    function likePost(el){
      const span = el.querySelector('.likes');
      if(!span) return;
      let n = parseInt(span.textContent||'0',10);
      n++;
      span.textContent = n;
      el.disabled = true;
    }

    document.getElementById('postBtn').addEventListener('click', ()=>{
      const txt = document.getElementById('composeText').value.trim();
      if(!txt) return alert('Write something first');
      const feed = document.getElementById('feed');
      const id = Date.now();
      const el = document.createElement('div');
      el.className = 'post card';
      el.innerHTML = `\n        <div class="meta">\n          <img src="https://via.placeholder.com/44" alt="author">\n          <div>\n            <div style="font-weight:600">You</div>\n            <div style="font-size:12px;color:var(--muted)">Just now · Only you</div>\n          </div>\n        </div>\n        <div class="content">${escapeHtml(txt)}</div>\n        <div class="actions">\n          <button class="btn btn-like" onclick="likePost(this)">Like (<span class="likes">0</span>)</button>\n          <button class="btn">Comment</button>\n          <button class="btn">Share</button>\n        </div>\n      `;
      feed.insertBefore(el, feed.firstChild);
      document.getElementById('composeText').value='';
    });

    function escapeHtml(s){return s.replaceAll('&','&amp;').replaceAll('<','&lt;').replaceAll('>','&gt;');}
  </script>

  <!--
    NOTE: This is an educational mockup inspired by typical social media layouts.
    Do NOT use this to impersonate or reproduce Facebook's exact design or branding.
  -->
</body>
</html>
