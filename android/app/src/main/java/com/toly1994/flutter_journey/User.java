//package com.toly1994.flutter_journey;
//
////https://api.github.com/users/{username}
//public class User {
//
//
//    /**
//     * login : toly1994328
//     * id : 26687012
//     * node_id : MDQ6VXNlcjI2Njg3MDEy
//     * avatar_url : https://avatars3.githubusercontent.com/u/26687012?v=4
//     * gravatar_id :
//     * url : https://api.github.com/users/toly1994328
//     * html_url : https://github.com/toly1994328
//     * followers_url : https://api.github.com/users/toly1994328/followers
//     * following_url : https://api.github.com/users/toly1994328/following{/other_user}
//     * gists_url : https://api.github.com/users/toly1994328/gists{/gist_id}
//     * starred_url : https://api.github.com/users/toly1994328/starred{/owner}{/repo}
//     * subscriptions_url : https://api.github.com/users/toly1994328/subscriptions
//     * organizations_url : https://api.github.com/users/toly1994328/orgs
//     * repos_url : https://api.github.com/users/toly1994328/repos
//     * events_url : https://api.github.com/users/toly1994328/events{/privacy}
//     * received_events_url : https://api.github.com/users/toly1994328/received_events
//     * type : User
//     * site_admin : false
//     * name : 张风捷特烈（toly）
//     * company : 捷特王国
//     * blog : http://www.toly1994.com
//     * location : China
//     * email : null
//     * hireable : null
//     * bio : The king of coder.
//     * public_repos : 64
//     * public_gists : 0
//     * followers : 238
//     * following : 9
//     * created_at : 2017-03-26T09:55:25Z
//     * updated_at : 2019-07-15T08:05:52Z
//     */
//
//    private String login;
//    private int id;
//    private String node_id;
//    private String avatar_url;
//    private String gravatar_id;
//    private String url;
//    private String html_url;
//    private String followers_url;
//    private String following_url;
//    private String gists_url;
//    private String starred_url;
//    private String subscriptions_url;
//    private String organizations_url;
//    private String repos_url;
//    private String events_url;
//    private String received_events_url;
//    private String type;
//    private boolean site_admin;
//    private String name;
//    private String company;
//    private String blog;
//    private String location;
//    private Object email;
//    private Object hireable;
//    private String bio;
//    private int public_repos;
//    private int public_gists;
//    private int followers;
//    private int following;
//    private String created_at;
//    private String updated_at;
//
//    public String getLogin() {
//        return login;
//    }
//
//    public void setLogin(String login) {
//        this.login = login;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getNode_id() {
//        return node_id;
//    }
//
//    public void setNode_id(String node_id) {
//        this.node_id = node_id;
//    }
//
//    public String getAvatar_url() {
//        return avatar_url;
//    }
//
//    public void setAvatar_url(String avatar_url) {
//        this.avatar_url = avatar_url;
//    }
//
//    public String getGravatar_id() {
//        return gravatar_id;
//    }
//
//    public void setGravatar_id(String gravatar_id) {
//        this.gravatar_id = gravatar_id;
//    }
//
//    public String getUrl() {
//        return url;
//    }
//
//    public void setUrl(String url) {
//        this.url = url;
//    }
//
//    public String getHtml_url() {
//        return html_url;
//    }
//
//    public void setHtml_url(String html_url) {
//        this.html_url = html_url;
//    }
//
//    public String getFollowers_url() {
//        return followers_url;
//    }
//
//    public void setFollowers_url(String followers_url) {
//        this.followers_url = followers_url;
//    }
//
//    public String getFollowing_url() {
//        return following_url;
//    }
//
//    public void setFollowing_url(String following_url) {
//        this.following_url = following_url;
//    }
//
//    public String getGists_url() {
//        return gists_url;
//    }
//
//    public void setGists_url(String gists_url) {
//        this.gists_url = gists_url;
//    }
//
//    public String getStarred_url() {
//        return starred_url;
//    }
//
//    public void setStarred_url(String starred_url) {
//        this.starred_url = starred_url;
//    }
//
//    public String getSubscriptions_url() {
//        return subscriptions_url;
//    }
//
//    public void setSubscriptions_url(String subscriptions_url) {
//        this.subscriptions_url = subscriptions_url;
//    }
//
//    public String getOrganizations_url() {
//        return organizations_url;
//    }
//
//    public void setOrganizations_url(String organizations_url) {
//        this.organizations_url = organizations_url;
//    }
//
//    public String getRepos_url() {
//        return repos_url;
//    }
//
//    public void setRepos_url(String repos_url) {
//        this.repos_url = repos_url;
//    }
//
//    public String getEvents_url() {
//        return events_url;
//    }
//
//    public void setEvents_url(String events_url) {
//        this.events_url = events_url;
//    }
//
//    public String getReceived_events_url() {
//        return received_events_url;
//    }
//
//    public void setReceived_events_url(String received_events_url) {
//        this.received_events_url = received_events_url;
//    }
//
//    public String getType() {
//        return type;
//    }
//
//    public void setType(String type) {
//        this.type = type;
//    }
//
//    public boolean isSite_admin() {
//        return site_admin;
//    }
//
//    public void setSite_admin(boolean site_admin) {
//        this.site_admin = site_admin;
//    }
//
//    public String getName() {
//        return name;
//    }
//
//    public void setName(String name) {
//        this.name = name;
//    }
//
//    public String getCompany() {
//        return company;
//    }
//
//    public void setCompany(String company) {
//        this.company = company;
//    }
//
//    public String getBlog() {
//        return blog;
//    }
//
//    public void setBlog(String blog) {
//        this.blog = blog;
//    }
//
//    public String getLocation() {
//        return location;
//    }
//
//    public void setLocation(String location) {
//        this.location = location;
//    }
//
//    public Object getEmail() {
//        return email;
//    }
//
//    public void setEmail(Object email) {
//        this.email = email;
//    }
//
//    public Object getHireable() {
//        return hireable;
//    }
//
//    public void setHireable(Object hireable) {
//        this.hireable = hireable;
//    }
//
//    public String getBio() {
//        return bio;
//    }
//
//    public void setBio(String bio) {
//        this.bio = bio;
//    }
//
//    public int getPublic_repos() {
//        return public_repos;
//    }
//
//    public void setPublic_repos(int public_repos) {
//        this.public_repos = public_repos;
//    }
//
//    public int getPublic_gists() {
//        return public_gists;
//    }
//
//    public void setPublic_gists(int public_gists) {
//        this.public_gists = public_gists;
//    }
//
//    public int getFollowers() {
//        return followers;
//    }
//
//    public void setFollowers(int followers) {
//        this.followers = followers;
//    }
//
//    public int getFollowing() {
//        return following;
//    }
//
//    public void setFollowing(int following) {
//        this.following = following;
//    }
//
//    public String getCreated_at() {
//        return created_at;
//    }
//
//    public void setCreated_at(String created_at) {
//        this.created_at = created_at;
//    }
//
//    public String getUpdated_at() {
//        return updated_at;
//    }
//
//    public void setUpdated_at(String updated_at) {
//        this.updated_at = updated_at;
//    }
//}
