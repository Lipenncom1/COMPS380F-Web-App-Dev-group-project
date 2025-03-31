package hkmu.wadd.View;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.View;

import java.util.Map;

public class renderView implements View {
    private String path;

    public renderView(String path) {
        this.path = path;
    }

    @Override
    public String getContentType() {
        return "text/html";
    }

    @Override
    public void render(Map<String, ?> model, HttpServletRequest request,
                       HttpServletResponse response) throws Exception {
        //Model attribute -> attached to request so that it fetches the register.jsp page from jsp file
        for (Map.Entry<String, ?> entry : model.entrySet()) {
            request.setAttribute(entry.getKey(), entry.getValue());
        }

        //Dispatcher sends the jsp file as response
        RequestDispatcher dispatcher = request.getRequestDispatcher(this.path);
        dispatcher.forward(request, response);
    }
}
