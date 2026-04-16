function renderSidebar(activePage) {
  const pages = [
    { id: 'home',          label: 'Dashboard',  icon: 'bi-grid-1x2',         href: '/myapp/admin_home_get/',          section: 'Overview' },
    { id: 'viewdoctor',    label: 'Doctors',     icon: 'bi-people',           href: '/myapp/admin_viewdoctor_get/',   section: 'Medical Staff' },
    { id: 'viewschedule',  label: 'Schedules',   icon: 'bi-calendar3',        href: '/myapp/admin_viewschedule_get/', section: null },
    { id: 'verifybooking', label: 'Bookings',    icon: 'bi-clipboard2-check', href: '/myapp/admin_verifybooking_get/',section: 'Patients' },
    // { id: 'complaints',    label: 'Complaints',  icon: 'bi-chat-dots',        href: '/myapp/admin_viewcomplaint_get/',     section: null },
  ];

  let navHTML = '';
  let lastSection = '';
  pages.forEach(p => {
    if (p.section && p.section !== lastSection) {
      navHTML += `<div class="nav-section-label">${p.section}</div>`;
      lastSection = p.section;
    }
 else if (!p.section) {
        // Reset lastSection so the next named section can trigger a header
        lastSection = ''; 
    }
    navHTML += `<a href="${p.href}" class="nav-item ${activePage === p.id ? 'active' : ''}">
      <i class="bi ${p.icon}"></i> ${p.label}
    </a>`;
  });

  return `
  <aside class="sidebar">
    <div class="sidebar-top">
      <a href="index.html" class="brand">
        <div class="brand-icon"><i class="bi bi-heart-pulse-fill"></i></div>
        <div class="brand-text">
          <h2>CareSync</h2>
          <span>Healthcare Admin</span>
        </div>
      </a>
    </div>
    <nav class="sidebar-nav">${navHTML}</nav>
    <div class="sidebar-user">
      <div class="user-avatar"><i class="bi bi-person-fill"></i></div>
      <div class="user-info"><p>Admin</p><span>Super Admin</span></div>
      <button class="logout-btn" title="Logout"><a href='/myapp/logout_get/'><i class="bi bi-box-arrow-right"></i></a></button>
    </div>
  </aside>`;
}
