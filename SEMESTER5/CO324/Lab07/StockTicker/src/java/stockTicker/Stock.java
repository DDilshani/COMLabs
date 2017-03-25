package stockTicker;

import java.text.*;
import java.util.*;
import java.util.logging.*;

final class Stock extends Thread {

    static final long INTERVAL = 2000;
    final Random rand = new Random();
    final DateFormat df = new SimpleDateFormat("HH:mm:ss", Locale.ENGLISH);


    private int price;
    private Date time;

    /**
     * Periodically updates stock info and notifies servlet threads.
     */
    @Override
    public void run() {
        while (!Thread.interrupted()) {
            synchronized (this) {
                price = 90 + rand.nextInt(20);
                time = new Date();

                Logger.getGlobal().log(Level.INFO, this.toString());
                notifyAll();
            }
            try {
                Thread.sleep(INTERVAL);
            } catch (InterruptedException e) {
                return;
            }
        }
    }
    
    public Date getTime(){
        return this.time;
    }
    
    public int getPrice(){
        return this.price;
    }
    
    @Override
    public String toString(){
        
       return ("Time: " +this.time + ", Price: " + this.price);
       
    }
    
    
}
