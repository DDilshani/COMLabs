import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.testmail.email.Email;
import org.testmail.email.Recipient;

import javax.mail.Message;
import java.util.ArrayList;
import java.util.List;

//import static org.testmail.email.Email.interpretRecipientData;

/**
 * Created by Udaree on 9/4/2017.
 */
public class EmailTest {

    private Email email;

    @Before
    public void setUp() throws Exception {
        email = new Email(true);
    }

    @Test
    public void setAndGetIdTest()throws Exception {
        String expected = "User";
        email.setId(expected);
        String actual = email.getId();

        Assert.assertEquals(expected,actual);
    }

    @Test
    public void addToRecipientsWithAddressArgsTest() throws Exception {
        String addresses = "abc123@gmail.com, def456@gmail.com";
        String addr1 = "mail1@gmail.com, mail2@gmail.com";
        String addr2 = "mail3@gmail.com";

        email.addToRecipients(addresses);
        email.addToRecipients(addr1, addr2);
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "abc123@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient(null, "def456@gmail.com", Message.RecipientType.TO);
        Recipient recipient3 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient4 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient5 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.TO);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void addCcRecipientsWithAddressArgsTest() throws Exception {
        String addresses = "abc123@gmail.com, def456@gmail.com";
        String addr1 = "mail1@gmail.com, mail2@gmail.com";
        String addr2 = "mail3@gmail.com";

        email.addCcRecipients(addresses);
        email.addCcRecipients(addr1, addr2);
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "abc123@gmail.com", Message.RecipientType.CC);
        Recipient recipient2 = new Recipient(null, "def456@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient4 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient5 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.CC);

        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void addBccRecipientsWithAddressArgsTest() throws Exception {
        String addresses = "abc123@gmail.com, def456@gmail.com";
        String addr1 = "mail1@gmail.com, mail2@gmail.com";
        String addr2 = "mail3@gmail.com";

        email.addBccRecipients(addresses);
        email.addBccRecipients(addr1, addr2);
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "abc123@gmail.com", Message.RecipientType.BCC);
        Recipient recipient2 = new Recipient(null, "def456@gmail.com", Message.RecipientType.BCC);
        Recipient recipient3 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient4 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient5 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.BCC);

        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void addNamedToRecipientsTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        email.addNamedToRecipients("User1", addresses);
        email.addNamedToRecipients("User2", addresses, "mail3@gmail.com");
        email.addNamedToRecipients("User1", "mail3@gmail.com"); // To check duplicates
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient3 = new Recipient("User2", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient4 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient5 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.TO);
        Recipient recipient6 = new Recipient("User1", "mail3@gmail.com", Message.RecipientType.TO);

        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);
        expected.add(recipient6);

        Assert.assertEquals(expected, actual);


    }

    @Test
    public void addNamedCcRecipientsTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        email.addNamedCcRecipients("User1", addresses);
        email.addNamedCcRecipients("User2", addresses, "mail3@gmail.com");
        email.addNamedCcRecipients("User1", "mail3@gmail.com"); // To check duplicates
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient("User2", "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient4 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient5 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.CC);
        Recipient recipient6 = new Recipient("User1", "mail3@gmail.com", Message.RecipientType.CC);

        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);
        expected.add(recipient6);

        Assert.assertEquals(expected, actual);


    }

    @Test
    public void addNamedBccRecipientsTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        email.addNamedBccRecipients("User1", addresses);
        email.addNamedBccRecipients("User2", addresses, "mail3@gmail.com");
        email.addNamedBccRecipients("User1", "mail3@gmail.com"); // To check duplicates
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient3 = new Recipient("User2", "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient4 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient5 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.BCC);
        Recipient recipient6 = new Recipient("User1", "mail3@gmail.com", Message.RecipientType.BCC);

        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);
        expected.add(recipient4);
        expected.add(recipient5);
        expected.add(recipient6);

        Assert.assertEquals(expected, actual);


    }

    @Test
    public void addRecipientsTest() throws Exception {
        email.addRecipients("User1", Message.RecipientType.TO, "mail1@gmail.com");
        email.addRecipients("User2", Message.RecipientType.CC, "mail2@gmail.com", "mail3@gmail.com");
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.CC);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);

    }

    @Test
    public void addRecipientsWithRecipientArgsTest() throws Exception {
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.BCC);

        email.addRecipients(recipient1, recipient2, recipient3);
        List<Recipient> actual = email.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }
}
