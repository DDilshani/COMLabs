import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.testmail.email.EmailBuilder;
import org.testmail.email.Recipient;

import javax.mail.Message;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Udaree on 9/4/2017.
 */
public class EmailBuilderTest {
    
    private EmailBuilder emailbuilder;

    @Before
    public void setUp() throws Exception {
        emailbuilder = new EmailBuilder();
    }

    @Test
    public void emailBuiderToWithRecipientsTest() throws Exception {
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.TO);

        emailbuilder.to(recipient1, recipient2, recipient3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderToWithNameAndAddressListTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        emailbuilder.to("User1", addresses);
        emailbuilder.to("User2", "mail3@gmail.com");
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.TO);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderToWithAddressArgsTest() throws Exception {
        String addr1 = "mail1@gmail.com";
        String addr2 = "mail2@gmail.com";
        String addr3 = "mail3@gmail.com";
        emailbuilder = emailbuilder.to(addr1, addr2, addr3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.TO);
        Recipient recipient2 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.TO);
        Recipient recipient3 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.TO);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderCcWithRecipientsTest() throws Exception {
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient2 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.CC);

        emailbuilder.cc(recipient1, recipient2, recipient3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderCcWithNameAndAddressListTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        emailbuilder.cc("User1", addresses);
        emailbuilder.cc("User2", "mail3@gmail.com");
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.CC);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderCcWithAddressArgsTest() throws Exception {
        String addr1 = "mail1@gmail.com";
        String addr2 = "mail2@gmail.com";
        String addr3 = "mail3@gmail.com";
        emailbuilder = emailbuilder.cc(addr1, addr2, addr3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.CC);
        Recipient recipient2 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.CC);
        Recipient recipient3 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.CC);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderBccWithRecipientsTest() throws Exception {
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient2 = new Recipient("User2", "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.BCC);

        emailbuilder.bcc(recipient1, recipient2, recipient3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderBccWithNameAndAddressListTest() throws Exception {
        String addresses = "mail1@gmail.com, mail2@gmail.com";
        emailbuilder.bcc("User1", addresses);
        emailbuilder.bcc("User2", "mail3@gmail.com");
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient("User1", "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient2 = new Recipient("User1", "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient3 = new Recipient("User2", "mail3@gmail.com", Message.RecipientType.BCC);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void emailBuiderBccWithAddressArgsTest() throws Exception {
        String addr1 = "mail1@gmail.com";
        String addr2 = "mail2@gmail.com";
        String addr3 = "mail3@gmail.com";
        emailbuilder = emailbuilder.bcc(addr1, addr2, addr3);
        List<Recipient> actual = emailbuilder.getRecipients();

        //Creating expected Recipient List
        List<Recipient> expected = new ArrayList<>();
        Recipient recipient1 = new Recipient(null, "mail1@gmail.com", Message.RecipientType.BCC);
        Recipient recipient2 = new Recipient(null, "mail2@gmail.com", Message.RecipientType.BCC);
        Recipient recipient3 = new Recipient(null, "mail3@gmail.com", Message.RecipientType.BCC);
        expected.add(recipient1);
        expected.add(recipient2);
        expected.add(recipient3);

        Assert.assertEquals(expected, actual);
    }

    @Test
    public void addHeaderTest() throws Exception {
        emailbuilder.addHeader("Title", 2);
        Map<String, String> actual = emailbuilder.getHeaders();

        Map<String, String> expected = new HashMap<>();
        expected.put("Title", String.valueOf(2));

        Assert.assertEquals(expected, actual);

    }
}
