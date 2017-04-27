
public class FSM{

	enum State {OFF, MED, HI};
	State current = State.OFF;
	private pulseCount = 0;

	public void sendPulses (int count) {
        System.err.println("Sending " + count +" pulses.");
    }

    public switchState(String s){

    	switch(s){

    		case "OFF":
            if(current == State.FAN){
            	sendPulses(2);
            } else if (current == State.AC){
            	sendPulses(1);
            }
            current = State.OFF;
            
            break;

            case "MED":

            if(current == State.OFF){
            	sendPulses(1);	
            } else if (current == State.AC){
            	sendPulses(2);
            }
            current = State.FAN;             
            break;  

            case "HI":

            if(current == State.OFF){
            	sendPulses(2);	
            } else if (current == State.FAN){
            	sendPulses(1);
            } 
            current = State.AC;
            break;    
    	}
    }
}