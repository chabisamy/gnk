package selenium

import grails.test.mixin.TestFor
import org.gnk.selectintrigue.SelectIntrigueController
import org.openqa.selenium.By
import org.openqa.selenium.JavascriptExecutor
import org.openqa.selenium.WebDriver
import org.openqa.selenium.WebElement
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.support.ui.Select

/**
 * Created by pico on 16/04/2014.
 */
@TestFor(SelectIntrigueController)
class CreateGnTests {

    WebDriver driver = new FirefoxDriver()

    void testClickToCreateGn() {
        driver.get("http://localhost:8090/gnk/")
        WebElement we = driver.findElement(By.id("username")).sendKeys("pico.2607@gmail.com")
        we = driver.findElement(By.id("password")).sendKeys("gnk")
        we = driver.findElement(By.id("submit")).click()
        we = driver.findElement(By.cssSelector(".how-to a"))
        we.click()
    }

    // Fill a field declared by is ID
    void fillInputById(String id, String value) {

        WebElement we = driver.findElement(By.id(id))
        we.sendKeys(value)
    }

    // Fill a integer field declared by is ID
    void fillIntegerInputById(String id, String value) {

        JavascriptExecutor js = (JavascriptExecutor) driver
        js.executeScript("javascript:document.getElementById(\"" + id + "\").value=" + value + ";")
    }

    // Check all the boxes of a page
    void checkRandomBox() {

        List<WebElement> lwe = driver.findElements(By.cssSelector("[type='checkbox']"))
        int n = lwe.size()
        Random r = new Random()
        int count = r.nextInt(n)
        while (count != 0) {
            int i = r.nextInt(n)
            print lwe.get(i)
            lwe.get(i).click()
        }
    }

    void testParallelisedGnCreation() {

        driver.get("http://localhost:8090/gnk/")
        WebElement we = driver.findElement(By.id("username")).sendKeys("pico.2607@gmail.com")
        we = driver.findElement(By.id("password")).sendKeys("gnk")
        we = driver.findElement(By.id("submit")).click()
        we = driver.findElement(By.cssSelector(".how-to a")) // [type='checkbox']
        we.click()

        // -------- BEGIN EDIT GN --------
        we = driver.findElement(By.linkText("Création/Edition"))
        we.click()

        fillInputById("name", "testSelenium")
        fillIntegerInputById("gnPIPMin", "5")
        fillIntegerInputById("gnPIPMax", "50")
        fillIntegerInputById("gnDuration", "10")
        fillIntegerInputById("gnNbPlayers", "8")
        fillIntegerInputById("gnNbWomen", "2")
        fillIntegerInputById("gnNbMen", "3")
        fillInputById("gnDate", "2014-04-12")
        fillInputById("gnDateHour", "11:06")

        we = driver.findElements(By.className("btn")).get(2) // tags
        we.click()
        we = driver.findElement(By.id("tags_1")).click()
        we = driver.findElement(By.id("tags_3")).click()
        we = driver.findElement(By.id("tags_2")).click()
        we = driver.findElement(By.cssSelector("#tagsModal .close")).click() // close
        fillInputById("t0Hour", "11:10")
//        we = driver.findElements(By.className("btn")).get(3) // tagsEvenmential
//        we.click()
//        we = driver.findElement(By.id("tagsEvenemential_4028")).click()
//        we = driver.findElement(By.id("tagsEvenemential_4013")).click()
//        we = driver.findElement(By.id("tagsEvenemential_4036")).click()
//        we = driver.findElement(By.cssSelector("#tagsEvenementialModal .close")).click() // close
        fillInputById("t0Date", "2014-04-13")
//        we = driver.findElements(By.className("btn")).get(4) // tagsMainstream
//        we.click()
//        we = driver.findElement(By.id("tagsMainstream_4010")).click()
//        we = driver.findElement(By.id("tagsMainstream_4022")).click()
//        we = driver.findElement(By.id("tagsMainstream_4052")).click()
//        we = driver.findElement(By.cssSelector("#tagsMainstreamModal .close")).click() // close

        Select slct = new Select(driver.findElement(By.id("gnUnivers"))) // select Univers
        slct.selectByIndex(3)

        Select select = new Select(driver.findElement(By.id("gnArchitechture"))) // select mainstream / parallelise
        select.selectByIndex(1)

        we = driver.findElements(By.className("btn-primary")).first() // Update button
        we.click()
        // -------- END EDIT GN --------
        // -------- BEGIN ROLE2PERSO --------
        we = driver.findElement(By.cssSelector("#roleToPersoFrom [type=\"submit\"]")).click()
        // -------- END ROLE2PERSO
        // -------- BEGIN SUBSTITUTION ---------
        we = driver.findElement(By.cssSelector("input[value=\"Substitution\"]")).click()
        we = driver.findElement(By.id("runSubCharactersButton")).click() // characters
        we = driver.findElement(By.linkText("Ressources")).click()
        we = driver.findElement(By.id("runSubResourcesButton")).click()
        we = driver.findElement(By.linkText("Lieux")).click()
        we = driver.findElement(By.id("runSubPlacesButton")).click()
        we = driver.findElement(By.linkText("Personnages")).click()

        while (driver.findElement(By.id("charsPercentage")).getText() != "100 %")
        {
            Thread.sleep(2000)
        }

        we = driver.findElement(By.id("publication")).click()
        we = driver.findElements(By.className("btn")).first().click()
        // --------  END SUBSTITUTION ---------
    }

    void testMainstreamGnCreation() {

        driver.get("http://localhost:8090/gnk/")
        WebElement we = driver.findElement(By.id("username")).sendKeys("pico.2607@gmail.com")
        we = driver.findElement(By.id("password")).sendKeys("gnk")
        we = driver.findElement(By.id("submit")).click()
        we = driver.findElement(By.cssSelector(".how-to a")) // [type='checkbox']
        we.click()

        // -------- BEGIN EDIT GN --------
        we = driver.findElement(By.linkText("Création/Edition"))
        we.click()

        fillInputById("name", "testSelenium")
        fillIntegerInputById("gnPIPMin", "5")
        fillIntegerInputById("gnPIPMax", "50")
        fillIntegerInputById("gnDuration", "10")
        fillIntegerInputById("gnNbPlayers", "8")
        fillIntegerInputById("gnNbWomen", "2")
        fillIntegerInputById("gnNbMen", "3")
        fillInputById("gnDate", "2014-04-12")
        fillInputById("gnDateHour", "11:06")

        we = driver.findElements(By.className("btn")).get(2) // tags
        we.click()
        we = driver.findElement(By.id("tags_1")).click()
        we = driver.findElement(By.id("tags_3")).click()
        we = driver.findElement(By.id("tags_2")).click()
        we = driver.findElement(By.cssSelector("#tagsModal .close")).click() // close
        fillInputById("t0Hour", "11:10")
//        we = driver.findElements(By.className("btn")).get(3) // tagsEvenmential
//        we.click()
//        we = driver.findElement(By.id("tagsEvenemential_4028")).click()
//        we = driver.findElement(By.id("tagsEvenemential_4013")).click()
//        we = driver.findElement(By.id("tagsEvenemential_4036")).click()
//        we = driver.findElement(By.cssSelector("#tagsEvenementialModal .close")).click() // close
        fillInputById("t0Date", "2014-04-13")
//        we = driver.findElements(By.className("btn")).get(4) // tagsMainstream
//        we.click()
//        we = driver.findElement(By.id("tagsMainstream_4010")).click()
//        we = driver.findElement(By.id("tagsMainstream_4022")).click()
//        we = driver.findElement(By.id("tagsMainstream_4052")).click()
//        we = driver.findElement(By.cssSelector("#tagsMainstreamModal .close")).click() // close

        Select slct = new Select(driver.findElement(By.id("gnUnivers"))) // select Univers
        slct.selectByIndex(2)

        Select select = new Select(driver.findElement(By.id("gnArchitechture"))) // select mainstream / parallelise
        select.selectByIndex(0)

        we = driver.findElements(By.className("btn-primary")).first() // Update button
        we.click()
        // -------- END EDIT GN --------
        // -------- BEGIN ROLE2PERSO --------
        we = driver.findElement(By.cssSelector("#roleToPersoFrom [type=\"submit\"]")).click()
        // -------- END ROLE2PERSO
        // -------- BEGIN SUBSTITUTION ---------
        we = driver.findElement(By.cssSelector("input[value=\"Substitution\"]")).click()
        we = driver.findElement(By.id("runSubCharactersButton")).click() // characters
        we = driver.findElement(By.linkText("Ressources")).click()
        we = driver.findElement(By.id("runSubResourcesButton")).click()
        we = driver.findElement(By.linkText("Lieux")).click()
        we = driver.findElement(By.id("runSubPlacesButton")).click()
        we = driver.findElement(By.linkText("Personnages")).click()

        while (driver.findElement(By.id("charsPercentage")).getText() != "100 %")
        {
            Thread.sleep(2000)
        }

        we = driver.findElement(By.id("publication")).click()
        we = driver.findElements(By.className("btn")).first().click()
        // --------  END SUBSTITUTION ---------
    }
}
