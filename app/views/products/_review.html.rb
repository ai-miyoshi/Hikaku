<% if @product.reviews.exists? %>
  <h3>レビュー</h3>
  <p>平均満足度
      <% if @product.reviews.present? %>
        <%=@product.review_average %>点
        <span class="rating-star"><i class="star-actived rate-<%=@product.review_average %>0"></i></span>
      <% else %>
        <span class="rating-star"><i class="star-actived rate-0"></i></span>
      <% end %>
  </p>

  <div class="card">
    <ul class="list-group list-group-flush">
      <li class="list-group-item"><%=review.user.nickname%>さん  満足度:<span class="rating-star"><i class="star-actived rate-<%= review.rate %>0"></i></span><span class="pull-right">使用期間<%= review.use_period%>年</span></li>
      <li class="list-group-item"><%= review.review %></li>
      <li class="list-group-item text-right">
        <span class="pull-left">
          <% if user_signed_in? && review.user.id == current_user.id %>
            <%= link_to '編集', "/products/#{@product.id}/reviews/#{review.id}/edit", method: :get %>
            <%= link_to '削除', "/products/#{@product.id}/reviews/#{review.id}", data: { confirm: "本当にレビューを削除してよろしいですか?" },  method: :delete %>
          <% end %>
        </span>
        <small>投稿日<%= review.created_at.strftime('%Y年%m月%d日')%></small>
      </li>
    </ul>
  </div>
<% else %>
  <h4>この製品にはレビューがまだありません。<br>レビューを投稿しませんか？</h4>
  <button type="button" class="btn btn-default">
    <%= link_to 'レビューを書く', "/products/#{@product.id}/reviews/new", method: :get %>
  </button>
  <% end %>