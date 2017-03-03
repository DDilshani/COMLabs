

/**
 * Created by mohammedfawzan on 10/1/16.
 */
public class Pair<K, V> {

    private K key;
    private V value;

    public Pair(K key, V value) {
        this.key = key;
        this.value = value;
    }

    public K getKey() {
        return key;
    }

    public void setKey(K key) {
        this.key = key;
    }

    public V getValue() {
        return value;
    }

    public void setValue(V value) {
        this.value = value;
    }

    public static void main(String[] args) {

        //Want store some eNo, name ??
        Pair<String, String> p1 = new Pair<>("E13175", "UCK");

        //Want to store eNo, marks??
        Pair<String, Integer> p2 = new Pair<>("E13175",100);

        //you can do this with any types :)

        //Cheers!


    }

}
