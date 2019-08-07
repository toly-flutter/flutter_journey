//package day3.toly_widget;
//
//import android.content.Context;
//import android.content.res.TypedArray;
//import android.graphics.Canvas;
//import android.graphics.Color;
//import android.graphics.Paint;
//import android.graphics.Path;
//import android.graphics.SweepGradient;
//import android.util.AttributeSet;
//import android.view.MotionEvent;
//import android.view.View;
//
//public class PanelView extends View {
//
//    private float mRadius = dp(150);
//
//    private int bottomColor;
//    private int arrowColor;
//
//    private double outAngle = 120;
//    private float outWidth;
//    private Paint outPaint;
//    private Paint linePaint;
//
//    private float innerRadius;
//
//    private float mValue = 60;
//
//
//    private Path arrowPath;
//    private float arrowWidth = dp(6);
//    private Paint arrowPaint;
//    private Paint textPaint;
//    private Path centerPath;
//    private Path centerPathRight;
//
//    private float perDeg;//没份小弧度数
//    private static final String[] texts=new String[]{"0","10","20","30","40","50","60","70"
//            ,"80","90","100","110","120","130","140","150","160","170","180",};
//    public PanelView(Context context) {
//        this(context, null, 0);
//    }
//
//    public PanelView(Context context, AttributeSet attrs) {
//        this(context, attrs, 0);
//    }
//
//    public PanelView(Context context, AttributeSet attrs, int defStyleAttr) {
//        super(context, attrs, defStyleAttr);
//        init(attrs);
//    }
//
//    private void init(AttributeSet attrs) {
//        TypedArray a = getContext().obtainStyledAttributes(attrs, R.styleable.PanelView);
//        mRadius = (int) a.getDimension(R.styleable.PanelView_pv_radius, mRadius);
//        a.recycle();
//
//        outPaint = new Paint();
//        outPaint.setAntiAlias(true);
//        outPaint.setStyle(Paint.Style.STROKE);
//
//
////        setBackgroundColor(Color.BLACK);
//
//        int[] colors = new int[]{
//                Color.parseColor("#613bfd"),//红
//                Color.parseColor("#d7cff9"),//红
//                Color.parseColor("#ebe7f8"),//红
//                Color.parseColor("#d7cff9"),//橙
//                Color.parseColor("#613bfd"),//黄
//        };
//
//        outPaint.setShader(new SweepGradient(mRadius, mRadius, colors, null));
//
//
//        outWidth = mRadius / 25;
//        mRadius = mRadius - outWidth / 2;
//
//
//        linePaint = new Paint();
//        linePaint.setAntiAlias(true);
//
//        innerRadius = mRadius / 10;
//
//        linePaint.setStyle(Paint.Style.STROKE);
//
//        textPaint=new Paint();
//        textPaint.setAntiAlias(true);
//        textPaint.setColor(Color.WHITE);
//        textPaint.setStyle(Paint.Style.FILL);
//        textPaint.setTextSize(mRadius / 15);
//        textPaint.setTextAlign(Paint.Align.CENTER);
//
//        outPaint.setStrokeWidth(mRadius / 25);
//        arrowPath = new Path();
//        centerPath = new Path();
//        centerPathRight = new Path();
//
//        arrowPaint = new Paint();
//        arrowPaint.setColor(Color.BLUE);
//        arrowPaint.setAntiAlias(true);
//    }
//
//    @Override
//    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
//        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
//
//        int width= (int) (mRadius*2+outWidth);
//        int height= (int) (width-mRadius*Math.cos(60.0/180*Math.PI)+outWidth);
//        setMeasuredDimension(width,height);
//    }
//
//    @Override
//    protected void onDraw(Canvas canvas) {
//        super.onDraw(canvas);
//        drawOutLine(canvas);
//
//        canvas.translate(mRadius, mRadius);
//
//        linePaint.setColor(Color.WHITE);
//        linePaint.setStrokeWidth(innerRadius / 12);
//        canvas.drawCircle(0, 0, innerRadius, linePaint);
//        drawDot(canvas, linePaint);
//        drawBottom(canvas);
//        drawCenter(canvas,mValue);
//        drawArrow(canvas, mValue);
//
//    }
//
//    private void drawCenter(Canvas canvas, float value) {
//        centerPath.reset();
//        centerPathRight.reset();
//        canvas.save();
//        canvas.rotate(150+15);
//        float r = mRadius / 2;
//        centerPath.addArc(-r,-r,r,r,0,value*perDeg);
//        linePaint.setColor(Color.BLUE);
//        linePaint.setStrokeWidth(mRadius/100);
//        canvas.drawPath(centerPath,linePaint);
//
//        centerPathRight.addArc(-r,-r,r,r,value*perDeg,perDeg*180-value*perDeg);
//        linePaint.setColor(Color.WHITE);
//        canvas.drawPath(centerPathRight,linePaint);
//
//        float deg=180.f+30;
//        float len=dp(24);
//        float startX= (float) (r*Math.cos(deg/180*Math.PI));
//        float startY= (float) (r*Math.sin(deg/180*Math.PI));
//        float endX= (float) ((r+len)*Math.cos(deg/180*Math.PI));
//        float endY= (float) ((r+len)*Math.sin(deg/180*Math.PI));
//linePaint.setStrokeWidth(mRadius/200);
//        canvas.drawLine(startX,startY,endX,endY,linePaint);
//        canvas.restore();
//
//    }
//
//    private void drawArrow(Canvas canvas, float mValue) {
//        canvas.save();
//        canvas.rotate(90 - 15 + mValue * perDeg);
//        arrowPath.moveTo(-arrowWidth / 2, 0);
//        arrowPath.rLineTo(arrowWidth / 2, mRadius - dp(4));
//        arrowPath.lineTo(arrowWidth / 2, 0);
//        arrowPath.close();
//        canvas.drawPath(arrowPath, arrowPaint);
//        canvas.restore();
//    }
//
//    private void drawBottom(Canvas canvas) {
//        float r = mRadius / 2;
//        linePaint.setColor(Color.GREEN);
//        linePaint.setStrokeWidth(mRadius / 12);
//        canvas.drawArc(-r, -r, r, r, 45, 90, false, linePaint);
//    }
//
//    private void drawOutLine(Canvas canvas) {
//        canvas.translate(outWidth / 2, outWidth / 2);
//        canvas.save();
//        canvas.rotate(90, mRadius, mRadius);
//        canvas.drawArc(0, 0, mRadius * 2, mRadius * 2, 60, 360 - 120, false, outPaint);
//        canvas.restore();
//    }
//
//    private void drawDot(Canvas canvas, Paint paint) {
//        linePaint.setColor(Color.WHITE);
//        paint.setStrokeWidth(mRadius / 150);
//        float deg = 150;
//        float areaDeg = 360 - deg;
//        perDeg = areaDeg / 180.0f;
//
//        for (int i = 0; i <= 180; i++) {
//            if (i % 10 == 0) {
//                canvas.save();
//                float newDeg=i * perDeg + 150 + 15;
//                canvas.rotate(newDeg);
//                canvas.drawLine(mRadius - dp(21), 0, mRadius - dp(4), 0, paint);
//                canvas.restore();
//
//
//                float offsetX= (float) (mRadius*0.77*Math.cos(newDeg/180*Math.PI));
//                float offsetY= (float) (mRadius*0.77*Math.sin(newDeg/180*Math.PI))+dp(mRadius/80);
//
//                canvas.drawText(texts[i/10],  offsetX,offsetY, textPaint);
//
//            } else {
//                canvas.save();
//                canvas.rotate(i * perDeg + 150 + 15);
//                canvas.drawLine(mRadius - dp(16), 0, mRadius - dp(8), 0, paint);
//                canvas.restore();
//            }
//        }
//    }
//
//
//    float posX = 0;
//    @Override
//    public boolean onTouchEvent(MotionEvent event) {
//        switch (event.getAction()) {
//            case MotionEvent.ACTION_DOWN:
//                posX = event.getX();
//                break;
//            case MotionEvent.ACTION_MOVE:
//               float dx= event.getX()-posX;
//               mValue+=dx/3;
////                Log.e("onTouchEvent", "onTouchEvent: " + event.getX());
////                mValue = event.getX() / 3.f;
//                posX=event.getX();
//                if (mValue<0) mValue=0;
//                if (mValue>180) mValue=180;
//                invalidate();
//
//                if (mOnDragListener!=null){
//                    mOnDragListener.onDrag(mValue);
//                }
//        }
//
//        return true;
//    }
//
//    private float dp(float dp) {
//        final float scale = getResources().getDisplayMetrics().density;
//        return (int) (dp * scale + 0.5f);
//    }
//
//    public float getValue() {
//        return mValue;
//    }
//
//   public interface OnDragListener{
//        void onDrag(float value);
//    }
//
//    private OnDragListener mOnDragListener;
//
//    public void setOnDragListener(OnDragListener mOnDragListener) {
//        this.mOnDragListener = mOnDragListener;
//    }
//}
//
