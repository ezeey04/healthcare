function renderUserSidebar(activePage) {
  const pages = [
    { id: 'home',        label: 'Dashboard',      icon: 'bi-grid-1x2',        href: 'user_home.html',           section: 'Overview' },
    { id: 'viewdoctor',  label: 'Find Doctors',   icon: 'bi-people',          href: 'user_view_doctors.html',   section: 'Appointments' },
    { id: 'viewschedule',label: 'Schedules',      icon: 'bi-calendar3',       href: 'user_view_schedule.html',  section: null },
    { id: 'bookings',    label: 'My Bookings',    icon: 'bi-clipboard2-check',href: 'user_view_bookings.html',  section: null },
    { id: 'prescription',label: 'Prescriptions',  icon: 'bi-capsule-pill',    href: 'user_view_prescription.html', section: null },
    { id: 'complaint',   label: 'Complaints',     icon: 'bi-chat-dots',       href: '#',                        section: 'Support' },
  ];

  let navHTML = '';
  let lastSection = '';
  pages.forEach(p => {
    if (p.section && p.section !== lastSection) {
      navHTML += `<div class="nav-section-label">${p.section}</div>`;
      lastSection = p.section;
    }
    navHTML += `<a href="${p.href}" class="nav-item ${activePage === p.id ? 'active' : ''}">
      <i class="bi ${p.icon}"></i> ${p.label}
    </a>`;
  });

  return `
  <aside class="sidebar">
    <div class="sidebar-top">
      <a href="user_home.html" class="brand">
        <div class="brand-icon"><i class="bi bi-heart-pulse-fill"></i></div>
        <div class="brand-text">
          <h2>CareSync</h2>
          <span>Patient Portal</span>
        </div>
      </a>
    </div>
    <nav class="sidebar-nav">${navHTML}</nav>
    <div class="sidebar-user">
      <div class="user-avatar">RJ</div>
      <div class="user-info">
        <p>Rahul Joshi</p>
        <span>Patient</span>
      </div>
      <a href="/myapp/logout_get/" class="logout-btn" title="Logout">
        <i class="bi bi-box-arrow-right"></i>
      </a>
    </div>
  </aside>`;
}
