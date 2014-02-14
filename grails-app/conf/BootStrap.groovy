import com.security.Role
import com.security.UserRole
import com.security.User
import com.test.Person
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter

class BootStrap {
    def init = { servletContext ->

        DateTimeFormatter fmt = DateTimeFormat.forPattern("dd/MM/yyyy");

        org.joda.time.LocalDate dd = fmt.parseLocalDate('29/05/2010');
        org.joda.time.LocalDate dd2 = fmt.parseLocalDate('31/03/1980');

        def pers = new Person(firstName: 'maryam',lastName: 'elleuch',email: 'test@tt.fr',birthDate: dd).save(flash:true)
        def pers2 = new Person(firstName: 'faiez',lastName: 'elleuch',email: 'test2@tt.fr',birthDate: dd2).save(flash:true)


        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def testUser = new User(username: 'faiez', password: '1234')
        testUser.save(flush: true)

        UserRole.create testUser, adminRole, true

        assert User.count() == 1
        assert Role.count() == 2
        assert UserRole.count() == 1

    }
    def destroy = {
    }

}
