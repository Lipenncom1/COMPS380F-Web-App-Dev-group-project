package hkmu.wadd.view;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletOutputStream;
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
        RequestDispatcher dispatcher = request.getRequestDispatcher(this.path);
        dispatcher.forward(request, response);
    }
}