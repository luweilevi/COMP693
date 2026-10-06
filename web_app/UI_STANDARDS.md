# UI_STANDARDS.md

## 1. Colours

Use these CSS variables. Do NOT use Bootstrap `bg-success`, `btn-success`, or `btn-primary`.

```css
:root {
  --primary: #1A5F5F;
  --primary-hover: #144A4A;
  --secondary: #C77D4A;
  --secondary-hover: #B05E2E;
  --bg-page: #F7F7F5;
  --bg-card: #FFFFFF;
  --text: #2C2C2C;
  --text-light: #6B7280;
  --border: #E5E7EB;
  --success: #2E7D32;
  --warning: #ED6C02;
  --error: #D32F2F;
}
```

---

## 2. CSS Classes

| Class | When to use |
|-------|-------------|
| `btn-primary-custom` | Save, Create, Join, Submit |
| `btn-secondary-custom` | Cancel, Back |
| `btn-outline-custom` | Login (on home), Clear filters |
| `btn-danger-custom` | Delete |
| `btn-sm` | Small buttons in tables |
| `badge-public` | Public group, Active status |
| `badge-private` | Private group, Inactive status |
| `card` | Card container |
| `card-body` | Card content |
| `card-title` | Card title (centered) |
| `chart-container` | Plotly chart (width 100%, height 380px) |
| `chart-summary` | Text below chart |
| `form-label` | Form field label |
| `form-control` | Text input, textarea |
| `form-select` | Dropdown |
| `table-responsive` | Wrap table for mobile |
| `table table-striped table-hover` | Table style |

**Example:**
```html
<button class="btn btn-primary-custom">Save</button>
<span class="badge-public">Public</span>
<div id="myChart" class="chart-container"></div>
```

---

## 3. Navigation Bar

Menu structure (already in `base.html`):

| Menu | Who sees it |
|------|-------------|
| Dashboard | All logged-in users (redirects to role-appropriate dashboard) |
| Data | All logged-in users |
| Config | Group Coordinator or Super Admin |
| Management | Group Coordinator or Super Admin |
| About Us, Contact Us, Profile, Logout | All logged-in users |

**Super Admin Dashboard:** Access via `/admin` (admin dashboard with charts + management cards)

---

## 4. URL Naming Rules

### Basic Rules

- Lowercase only
- Use hyphens `-` for multi-word resource names (not underscores)
- Use plural for resource names
- No role names in URLs (except pages truly exclusive to one role)
- No verbs as main URL

### URL Patterns

| Purpose | Pattern | Example |
|---------|---------|---------|
| List / index | `/{resource}` | `/bait-stations` |
| New form | `/{resource}/new` | `/bait-stations/new` |
| Edit form | `/{resource}/{id}/edit` | `/bait-stations/1/edit` |
| Delete | `/{resource}/{id}/delete` | `/bait-stations/1/delete` |
| Detail view | `/{resource}/{id}` | `/bait-stations/1` |
| Export | `/{resource}/export` | `/traps/export` |

### Analytics & Records URLs

| Purpose | URL | Note |
|---------|-----|------|
| Group dashboard | `/group/dashboard` | Group member analytics (3 charts) |
| Super admin dashboard | `/admin` | Admin dashboard with charts (Super Admin only) |
| Export trap catches | `/traps/export` | CSV export for Group Coordinator |
| Export bait station records | `/bait-stations/export` | CSV export for Group Coordinator |

### Special Resources

| Resource | URL | Note |
|----------|-----|------|
| Group dashboard | `/group/dashboard` | Uses current active group |
| Super admin dashboard | `/admin` | Admin dashboard with charts (Super Admin only) |
| Group map | `/location/group-area` | Uses current active group |
| Group updates | `/group/updates` | Group-scoped |
| My donations | `/my/donations` | User's own data |

### Examples

| Action | URL |
|--------|-----|
| List all bait types | `/bait-types` |
| Add a new bait type | `/bait-types/new` |
| Edit bait type ID 5 | `/bait-types/5/edit` |
| Delete bait type ID 5 | `/bait-types/5/delete` |
| Export trap data | `/traps/export` |
| View group dashboard | `/group/dashboard` |
| View my donations | `/my/donations` |
| List all bait stations | `/bait-stations` |
| View bait station ID 3 | `/bait-stations/3` |

---

## 5. Responsive Breakpoints

| Device | Width | Layout |
|--------|-------|--------|
| Desktop | ≥ 992px | 3 columns, full menu |
| Tablet | 768–991px | 2 columns, hamburger |
| Mobile | < 768px | 1 column, hamburger |

Test on Chrome DevTools before submitting.

---

## 6. Checklist for New Pages

- [ ] No `bg-success`, `btn-success`, `btn-primary`
- [ ] Use CSS classes from section 2
- [ ] No inline styles (`style="..."`)
- [ ] Table wrapped in `table-responsive`
- [ ] Chart uses `class="chart-container"`
- [ ] URL uses hyphens, not underscores
- [ ] URL follows section 4 rules
- [ ] Access check added in route
- [ ] Mobile: no horizontal scroll
