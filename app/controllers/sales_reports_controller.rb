class SalesReportsController < ApplicationController
    before_action :authenticate_vendor!

    def index
      @sales_reports = current_vendor.sales_reports
      .joins(:boat)
      .select('DISTINCT ON (boats.id) sales_reports.*, boats.id AS boat_id, boats.name AS boat_name, sales_reports.sold_at')
      .order('boats.id, sales_reports.sold_at DESC')
      .includes(:boat, :order)
end
end
