import java.util.List;
import java.util.concurrent.TimeUnit;
 
import org.junit.AfterClass;
import org.junit.Assert;
import java.io.File;
import org.junit.BeforeClass;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.chrome.ChromeDriver;


@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class NewSeleneseIT {
	 	private static ChromeDriver driver;
	 	WebElement element;
 
     @BeforeClass
     public static void openBrowser(){
                File file = new File("C:/chromedriver.exe");
		System.setProperty("webdriver.chrome.driver", file.getAbsolutePath());
		driver = new ChromeDriver();
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		} 
 
     @Test
     public void Avalid_UserCredential() throws InterruptedException, Exception{
 
        System.out.println("Starting test " + new Object(){}.getClass().getEnclosingMethod().getName());
        driver.get("http://Enterprise.Demo.Orangehrmlive.com");	
        driver.manage().window().maximize();             

        
        String getTestdata = null;
        String getAuthID =null;
        String getAuthpass = null;
        String stringToSplit = null;
                        
        getTestdata = NewClass.ReadData();
                
        // split return value from ReadData()
        stringToSplit = getTestdata;        
        String[] parts = stringToSplit.split(",");
        
 
       
        for (int i=0; i<getTestdata.length(); i=i+2){
            getAuthID = parts[0];
            getAuthpass = parts[1];  
            driver.findElement(By.id("txtUsername")).sendKeys(getAuthID);
            driver.findElement(By.id("txtPassword")).sendKeys(getAuthpass);
            driver.findElement(By.xpath("//*[@id=\"btnLogin\"]")).click();        
            String Expected_result = "OrangeHRM";
            String Actual_result=driver.getTitle();
            Assert.assertEquals(Expected_result,Actual_result) ;   

            driver.findElement(By.id("welcome")).click();
            driver.findElement(By.linkText("Logout")).click();
            
            
        }
                     

    }
     
     @Test
     public void BCheckUserRole() throws InterruptedException {
         
        
        driver.findElement(By.cssSelector("b")).click();    
        driver.findElement(By.id("menu_admin_UserManagement")).click();        
        driver.findElement(By.id("menu_admin_viewUserRoles")).click();
        List<WebElement> elementsList  = driver.findElements(By.xpath("//*[contains(@id,'ohrmList_chkSelectRecord')]"));
        String getVal;
        
        for(int i = 1; i <= elementsList.size(); ++i) {            
           getVal=  driver.findElement(By.xpath("/html/body/div[1]/div[3]/div[2]/div/div/form/div[4]/table/tbody/tr["+ i +"]/td[2]/a")).getText();
           System.out.println(getVal);
        }        
                
    }     
      
    @AfterClass
    public static void closeBrowser(){
            driver.quit();
    }
}