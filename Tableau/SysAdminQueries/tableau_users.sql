select
su.name user_name
, su.friendly_name user_display_name
, su.email user_email
, u.login_at user_login_at
, u.created_at user_created_at
, u.site_id user_site_id
, usr.licensing_rank user_licensing_rank
, usr.display_name user_site_role
-- , gsr.display_name group_minimum_site_role
-- , gsr.licensing_rank group_licensing_rank
, g.name group_name




-- user data
from users u
join system_users su
    on u.system_user_id = su.id
-- site data
join site_roles usr
    on u.site_role_id = usr.id


-- -- mininimum role of group (requires LDAP to be enabled)
-- join site_roles gsr
--     on g.minimum_site_role_id = gsr.id


-- bring in group data
join group_users gu
    on u.id = gu.user_id
join groups g
    on gu.group_id = g.id
