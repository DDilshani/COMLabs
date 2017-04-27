/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ziyan
 */
public class AC {
    
    final static int PATTERN = 0xa;
    enum State {OFF, FAN, AC};
    State current = State.OFF;

    public AC(){

    }
    
    public void sendPulses (int count) {
        System.err.println("Sending " + count +" pulses.");
    }
    
    public void switchState(String s){

        switch (s) {

            case "OFF":
            if(current == State.FAN){
            	sendPulses(2);
            } else if (current == State.AC){
            	sendPulses(1);
            }
            current = State.OFF;
            
            break;

            case "FAN":

            if(current == State.OFF){
            	sendPulses(1);	
            } else if (current == State.AC){
            	sendPulses(2);
            }
            current = State.FAN;             
            break;  

            case "AC":

            if(current == State.OFF){
            	sendPulses(2);	
            } else if (current == State.FAN){
            	sendPulses(1);
            } 
            current = State.AC;
            break;            
        }
    }

    public static void main (String[] args) {

    	AC ac = new AC();

    	ac.switchState(args[0]);


    }
}
