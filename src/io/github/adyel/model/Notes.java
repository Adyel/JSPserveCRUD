package io.github.adyel.model;

public class Notes {
    public String title;
    public String text;
    public int id;

    public Notes(int id, String title, String text) {
        this.id = id;
        this.title = title;
        this.text = text;
    }

    public String getTitle() {
        return title;
    }

    public String getText() {
        return text;
    }

    public int getId() {
        return id;
    }
}
