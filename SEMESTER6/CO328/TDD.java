
import org.testing.Assert;
import org.testing.annotatuions.Test;

public class TestNumbers {

	@Test
	public void TestMaximum(){
		Numbers num = new Numbers(10, 20);
		Assert.assertEquals( 20, num.getMax());
	}

	@Test
	public void testSum {
		Numbers num = new Numbers(10, 20);
		Assert.assertEquals(30, num.getSum());
	}
}




public class Numbers {

	private int num1;
	private int num2;

	public Numbers(int a, int b){
		this.num1 = a;
		this.num2 = b;

	}

	public int getMax(){
		if (num1 <= num2) {
			return num2;

		} else {
			return num1;
			
		}
	}

	public int getSum(){
		return (num1 + num2);
	}
}